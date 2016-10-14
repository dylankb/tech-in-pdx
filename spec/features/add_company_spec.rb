require 'rails_helper'

describe "the adding a company process" do

  it "adds a new company", js: true do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    click_link "Explore companies"
    click_link "Add a company"
    fill_in "Name", :with => 'New company'
    click_on "Create Company"
    expect(page).to have_content "New company successfully added!"
  end

  it "gives error when no name is entered", js: true do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    click_link "Explore companies"
    click_link 'Add a company'
    click_on 'Create Company'
    expect(page).to have_content 'errors'
  end

  it "adds a twitter count from a twitter handle", :vcr => true do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    click_link "Explore companies"
    click_link "Add a company"
    fill_in "Name", :with => 'New company'
    fill_in "Twitter handle", :with => 'epicodus'
    click_on "Create Company"
    expect(page).to have_css('#twitter-followers', :visible => "true")
  end
end
