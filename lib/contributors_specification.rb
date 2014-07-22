class ContributorsSpecification
  def initialize(client, config)
    @client = client
    @config = config
  end

  def is_satisfied_by(repo)
    contributors_count = @client.contributors(repo.full_name).count

    contributors_count >= @config['min_contributors'] &&
      contributors_count <= @config['max_contributors']
  end
end
