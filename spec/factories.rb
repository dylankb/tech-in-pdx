FactoryGirl.define do
  factory(:company) do
    name('New company')
    twitter_handle('epicodus')
  end

  factory(:user) do
    email('me@home.com')
    password('test')
  end

  factory(:office) do
    city('Portland')
    state('OR')
  end

  factory(:technology) do
    name('ruby')
  end
end
