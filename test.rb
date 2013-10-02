require_relative 'repository_downloader'
require_relative 'repository_filter'

repo_downloader = RepositoryDownloader.new
repos = repo_downloader.download('ruby')

repo_filter = RepositoryFilter.new
filtered_repos = repo_filter.filter(repos)

filtered_repos.each { |repo| puts repo.name }
