require 'yaml'

# Takes a list of repository and filters it according to some parameters.
# The resulting list will be considered suitable for contribution.
class RepositoryFilter
  def initialize
    @config = begin
      YAML.load(File.open('config.yml'))
    end
  end

  def filter(repos)
    repos.select do |repo|
      repo['open_issues_count'] > @config['min_open_issues']
    end
  end
end
