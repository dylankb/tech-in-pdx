FactoryGirl.define do
  factory(:company) do
    name('New company')
  end

  factory(:user) do
    email('me@home.com')
    password('test')
  end

  factory(:office) do
    city('Portland')
    state('OR')
  end
end
