require 'octokit'
require 'date'
require 'yaml'
require_relative 'repository_filter'

# Downloads repositories suitable for contribution according to parameters defined in
# config file or method parameters.
class RepositoryDownloader
  def initialize
    @client = Octokit::Client.new :netrc => true
    @client.login
    @filter = RepositoryFilter.new

    @config = begin
      YAML.load(File.open('config.yml'))
    end
  end

  # Download all suitable repos for the specified language.
  def download(language)
    min_push_date = Date.today << @config['min_months']

    search_results = @client.search_repos <<-eos
    stars:>#{@config['min_stars']} forks:>#{@config['min_forks']}
    language:#{language} pushed:>#{min_push_date}
    eos

    @filter.filter(search_results.items)
  end
end
