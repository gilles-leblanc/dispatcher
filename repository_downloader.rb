require 'octokit'
require 'date'
require 'yaml'
require_relative 'repository_filter'
require_relative 'pull_request_specification'

# Downloads repositories suitable for contribution according to parameters defined in
# config file or method parameters.
class RepositoryDownloader
  def initialize
    @client = Octokit::Client.new :netrc => true, :per_page => 100
    @client.login

    @config = begin
      YAML.load(File.open('config.yml'))
    end
    @min_push_date = Date.today << @config['min_months']

    @filter = RepositoryFilter.new(@config,
                                   PullRequestSpecification.new(@client, @config))
  end

  # Download all suitable repos for the specified language.
  def download(language)
    suitable_repos = []

    (1..@config['pages_to_search']).each do |current_page|
      search_results = @client.search_repos "stars:>=#{@config['min_stars']} " +
        "forks:>=#{@config['min_forks']} language:#{language} pushed:>#{@min_push_date}",
        :page => current_page

      suitable_repos += @filter.filter(search_results.items)
    end

    suitable_repos
  end
end
