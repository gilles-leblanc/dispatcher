require_relative 'repository_downloader'

repo_downloader = RepositoryDownloader.new
repos = repo_downloader.download('ruby')

repos.each { |repo| puts "#{repo.name}" }
