class Profile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :technologies

  validates_presence_of :github_username

  after_create :github_language_use
end


def github_language_use
  repositories = github_user_repositories
  language_use_by_repo = repository_languages(repositories)
  total_language_usage = sum_language_usage(language_use_by_repo)

  total_language_usage.take(3).each do |lang|
    technology = Technology.find_by(name: lang[0].downcase)
    if technology
      self.technologies.push(technology)
    end
  end
end

def github_user_repositories
  repos_url = URI("https://api.github.com/users/#{github_username}/repos?access_token=" + ENV['GITHUB_KEY'])
  response = Net::HTTP.get(repos_url)
  parsed_response = JSON.parse(response)

  parsed_response.each_with_object([]) do |response, repo_names|
    repo_names << response["name"]
  end
end

def repository_languages(repo_names)
  repo_names.each_with_object([]) do |repo, langs_by_repo|
    repo_lang_url = URI("https://api.github.com/repos/#{github_username}/#{repo}/languages?access_token=" + ENV['GITHUB_KEY'])
    response = Net::HTTP.get(repo_lang_url)
    parsed_response = JSON.parse(response)
    langs_by_repo << parsed_response
  end
end

def sum_language_usage(langs_by_repo)

  lang_use_count = langs_by_repo.each_with_object({}) do |repo, lang_counts|
    repo.each do |lang_name, bytes|
      if lang_counts.has_key?(lang_name)
        lang_counts[lang_name] += bytes
      else
        lang_counts[lang_name] = bytes
      end
    end
  end

  lang_use_count.sort_by {|key, value| value }.reverse
end
