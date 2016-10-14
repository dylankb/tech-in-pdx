require 'rails_helper'

describe Profile do
  it { should validate_presence_of :github_username }
end
