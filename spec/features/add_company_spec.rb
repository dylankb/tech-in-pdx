require 'rails_helper'

describe "the adding a company process" do

  it "adds a new company", js: true do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    visit companies_path
    click_link "Add a company"
    fill_in "Name", :with => 'New company'
    click_on "Create Company"
    expect(page).to have_content "Companies"
  end

  it "gives error when no name is entered", js: true do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    click_on "TechInPDX"
    click_on 'Add a company'
    sleep(1)
    click_on 'Create Company'
    expect(page).to have_content 'errors'
  end
end
