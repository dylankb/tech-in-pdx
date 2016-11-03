FactoryGirl.define do
  factory(:company) do
    name('New company')
    twitter_handle('epicodus')
  end

  factory(:user) do
    email('me@home.com')
    password('test')
    email_confirmed(true)
  end

  factory(:location) do
    city('Portland')
    state('OR')
  end

  factory(:technology) do
    name('ruby')
  end

  factory(:profile) do
    github_username('dylankb')
  end
end
