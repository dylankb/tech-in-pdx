require 'rails_helper'

describe "log in a user process" do
  it "logs a user in", js: true do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"
    expect(page).to have_content("You've logged in!")
  end

  it "user fails to log in if account is not authenticated", js: true do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", :with => "me@home.com"
    fill_in "Password", :with => "test"
    fill_in "Password confirmation", :with => "test"
    click_on "Sign up"

    click_on "Log In"
    fill_in "Email", :with => "me@home.com"
    fill_in "Password", :with => "test"
    click_on "Log in"
    expect(page).to have_content "Please confirm your account by clicking the link in your email"
  end
end
