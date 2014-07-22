require 'yaml'
require_relative '../repository_filter'
require_relative '../open_issues_specification'

describe 'Repository filter' do
  before(:each) do
    config = begin
               YAML.load(File.open('config.yml'))
             end

    @pull_request_spec = double('PullRequestSpecification')
    open_issues_specification = OpenIssuesSpecification.new(config)
    @filter = RepositoryFilter.new(config, open_issues_specification, @pull_request_spec)
  end

  context 'Open issues' do
    before(:each) do
      @no_open_issues = { 'open_issues_count' => 0 }
      @one_open_issue = { 'open_issues_count' => 1 }
      @nine_open_issues = { 'open_issues_count' => 9 }
      @ten_open_issues = { 'open_issues_count' => 10 }
      @eleven_open_issues = { 'open_issues_count' => 11 }
      @twenty_open_issues = { 'open_issues_count' => 20 }

      repos = []
      repos.push(@no_open_issues)
      repos.push(@one_open_issue)
      repos.push(@nine_open_issues)
      repos.push(@ten_open_issues)
      repos.push(@eleven_open_issues)
      repos.push(@twenty_open_issues)

      allow(@pull_request_spec).to receive(:is_satisfied_by).and_return(true)
      @filtered = @filter.filter(repos)
    end

    it { @filtered.should_not include @no_open_issues }
    it { @filtered.should_not include @one_open_issue }
    it { @filtered.should_not include @nine_open_issue }
    it { @filtered.should include @ten_open_issues }
    it { @filtered.should include @eleven_open_issues }
    it { @filtered.should include @twenty_open_issues }
  end

  context 'Pull request specification is not satisfied' do
    it 'specification returned false' do
      allow(@pull_request_spec).to receive(:is_satisfied_by).and_return(false)
      @twenty_open_issues = { 'open_issues_count' => 20 }
      repos = []
      repos.push(@twenty_open_issues)
      results = @filter.filter(repos)
      results.should be == []
    end
  end
end
