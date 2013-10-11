require_relative 'repository_downloader'

repo_downloader = RepositoryDownloader.new
repos = repo_downloader.download(ARGV[0])

repos.each { |repo| puts "#{repo.name}" }
