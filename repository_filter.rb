# Takes a list of repository and filters it according to some parameters.
# The resulting list will be considered suitable for contribution.
class RepositoryFilter
  def initialize(config, pull_request_specification)
    @config = config
    @pull_request_specification = pull_request_specification
  end

  def filter(repos)
    repos.select do |repo|
      (repo['open_issues_count'] >= @config['min_open_issues']) &&
        (@pull_request_specification.is_satisfied_by repo)
    end
  end
end
