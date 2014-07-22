# This class is used to tell if a repository is suitable in regards to it's open issues.
# The open issues are evaluated and if they conform to the specification,
# the repository will pass the specification.
class OpenIssuesSpecification
  def initialize(config)
    @config = config
  end

  def is_satisfied_by(repo)
    open_issues_count = repo['open_issues_count']

    open_issues_count >= @config['min_open_issues'] &&
      open_issues_count <= @config['max_open_issues']
  end
end
