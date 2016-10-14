require 'rails_helper'

describe "the adding a technology to a company process", :vcr => true do

  it "adds a technology", js: true do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Log In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)
    technology = FactoryGirl.create(:technology)
    click_on "Explore companies"
    click_on company.name
    click_on "Edit Details"
    find(:css, "#company_technology_ids_1").set(true)
    click_on "Update Company"
    expect(page).to have_content "updated"
  end
end
