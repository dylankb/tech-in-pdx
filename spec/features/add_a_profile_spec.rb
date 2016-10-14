require 'rails_helper'

describe "the adds a profile process" do
  it "adds a profile" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    profile = FactoryGirl.build(:profile)
    click_link "Profile"
    fill_in "Github username", with: profile.github_username
    click_on "Save Profile"
    expect(page).to have_content "Profile saved!"
  end
end
