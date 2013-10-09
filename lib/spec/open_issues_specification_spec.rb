require 'yaml'
require_relative '../open_issues_specification'

describe 'Open issues specification' do
  before(:all) do
    config = begin
               YAML.load(File.open('config.yml'))
             end

    @open_issues_spec = OpenIssuesSpecification.new(config)
  end

  context 'Open issues' do
    before(:each) do
      @no_open_issues = { 'open_issues_count' => 0 }
      @one_open_issue = { 'open_issues_count' => 1 }
      @nine_open_issues = { 'open_issues_count' => 9 }
      @ten_open_issues = { 'open_issues_count' => 10 }
      @eleven_open_issues = { 'open_issues_count' => 11 }
      @three_fifty_issues = { 'open_issues_count' => 350 }
      @three_fifty_one_issues = { 'open_issues_count' => 351 }
    end

    it { (@open_issues_spec.is_satisfied_by @no_open_issues).should be_false }
    it { (@open_issues_spec.is_satisfied_by @one_open_issue).should be_false }
    it { (@open_issues_spec.is_satisfied_by @nine_open_issues).should be_false }
    it { (@open_issues_spec.is_satisfied_by @ten_open_issues).should be_true }
    it { (@open_issues_spec.is_satisfied_by @eleven_open_issues).should be_true }
    it { (@open_issues_spec.is_satisfied_by @three_fifty_issues).should be_true }
    it { (@open_issues_spec.is_satisfied_by @three_fifty_one_issues).should be_false }
  end
end
