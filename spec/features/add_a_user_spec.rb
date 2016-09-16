require 'rails_helper'

describe "the adds a user process" do
  it "adds a user" do
    visit new_user_path
    fill_in "Email", :with => "me@home.com"
    fill_in "Password", :with => "test"
    fill_in "Password confirmation", :with => "test"
    click_on "Sign up"
  end
end
