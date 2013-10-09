# Takes a list of repository and filters it according to some parameters.
# The resulting list will be considered suitable for contribution.
class RepositoryFilter
  def initialize(config, open_issues_specification, pull_request_specification)
    @config = config
    @open_issues_specification = open_issues_specification
    @pull_request_specification = pull_request_specification
  end

  def filter(repos)
    repos.select do |repo|
      (@open_issues_specification.is_satisfied_by repo) &&
        (@pull_request_specification.is_satisfied_by repo)
    end
  end
end
