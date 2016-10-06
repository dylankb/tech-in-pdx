require 'rails_helper'

describe "the adding a technology to a company process" do

  it "adds a technology", js: true do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)
    location = FactoryGirl.create(:location)
    click_on "TechInPDX"
    click_on "New company"
    click_on "Edit Details"
    find(:css, "#company_location_ids_1").set(true)
    click_on "Update Company"
    expect(page).to have_content "updated"
  end
end
