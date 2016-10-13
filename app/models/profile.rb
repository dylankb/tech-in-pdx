class Profile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :technologies

  validates_presence_of :github_username

  after_create :github_language_use
end


def github_language_use
  repositories = github_repositories
  language_use_by_repo = repository_languages(repositories)
  total_language_usage = sum_language_usage(language_use_by_repo)

  total_language_usage.take(3).each do |lang|
    technology = Technology.find_by(name: lang[0].downcase)
    if technology
      self.technologies.push(technology)
    end
  end
end

def github_repositories
  repos_url = URI("https://api.github.com/users/#{github_username}/repos?access_token=" + ENV['GITHUB_KEY'])
  response = Net::HTTP.get(repos_url)
  parsed_response = JSON.parse(response)

  repo_names = []
  parsed_response.each do |response|
    repo_names << response["name"]
  end
  repo_names
end

def repository_languages(repo_names)
  langs_by_repo = []
  repo_names.each do |repo|
    repo_lang_url = URI("https://api.github.com/repos/#{github_username}/#{repo}/languages?access_token=" + ENV['GITHUB_KEY'])
    response = Net::HTTP.get(repo_lang_url)
    parsed_response = JSON.parse(response)
    langs_by_repo << parsed_response
  end
  langs_by_repo
end

def sum_language_usage(langs_by_repo)
  lang_count = {}

  langs_by_repo.each do |repo|
    repo.each do |lang_name, count|
      if lang_count.has_key?(lang_name)
        lang_count[lang_name] += count
      else
        lang_count[lang_name] = count
      end
    end
  end

  lang_count.sort_by {|key, value| value }.reverse
end
