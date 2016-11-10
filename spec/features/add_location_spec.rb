require 'rails_helper'

describe "the adding a technology to a company process" do

  it "adds a technology", js: true do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)
    location = FactoryGirl.create(:location)
    click_on "Explore companies"
    click_on company.name
    click_on "Edit Details"
    select "OR", :from => "company_offices_attributes_0_location_attributes_state"
    select "Medford", :from => "cities-of-state"
    click_on "Update Company"
    expect(page).to have_content "updated"
  end
end
