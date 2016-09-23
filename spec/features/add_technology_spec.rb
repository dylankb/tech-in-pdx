require 'rails_helper'

describe "the add a company process" do

  it "adds a new company" do
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

    click_on "Edit"
    click_on "Add a Technology"
    fill_in "Name", :with => 'Ruby'
    click_on "Create Technology"
    expect(page).to have_content "New technology"
  end
end
