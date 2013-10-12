require_relative 'repository_downloader'

repo_downloader = RepositoryDownloader.new
repos = repo_downloader.download(ARGV[0])

repos.each { |repo| puts "<li><a href='https://github.com/#{repo.full_name}'>#{repo.name}</a> #{repo.description} </li>" }
