require 'rails_helper'

describe 'External request' do
  it 'queries tech-in-pdx contributors on GitHub' do
    uri = URI('https://api.github.com/repos/dylankb/tech-in-pdx/contributors')

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
