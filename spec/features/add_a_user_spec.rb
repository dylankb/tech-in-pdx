require 'rails_helper'

describe "the adds a user process" do
  it "adds a user", js: true do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", :with => "me@home.com"
    fill_in "Password", :with => "test"
    fill_in "Password confirmation", :with => "test"
    click_on "Sign up"
    expect(page).to have_content "You created a new account!"
  end
end
