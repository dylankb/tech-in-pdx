require 'rails_helper'

describe "log in a user process" do
  it "logs a user in", js: true do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"
  end
end
