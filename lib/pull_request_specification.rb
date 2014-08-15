# This class is used to tell if a repository is suitable in regards to it's pull requests.
# The pull requests are evaluated and if they conform to the specification,
# the repository will pass the specification.
class PullRequestSpecification
  def initialize(client, config)
    @client = client
    @config = config
  end

  def is_satisfied_by(repo)
    @query_string = "#{repo.owner.login}/#{repo.name}"
    has_recent_merged_pull_requests && !has_too_many_long_standing_pull_requests
  end

  private

  # check for merged pull request since min months
  def has_recent_merged_pull_requests
    pull_requests = @client.pull_requests(@query_string, :state => 'closed')
    pull_requests.any? do |pull_request|
      merged_at = pull_request['merged_at']
      merged_at && merged_at > (Date.today << @config['min_months']).to_time
    end
  end

  # check for open uncommented pull request open longer than max months and with
  # number over long standing pull requests treshold
  def has_too_many_long_standing_pull_requests
    pull_requests = @client.pull_requests(@query_string, :state => 'open')
    count = pull_requests.count do |pull_request|
      pull_request['created_at'] < (Date.today << @config['max_months']).to_time &&
        pull_request['comments'] == 0
    end

    count > @config['open_pull_requests_treshold']
  end
end
