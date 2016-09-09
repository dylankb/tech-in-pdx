require 'rails_helper'

describe "the add a company process" do
  it "adds a new company" do
    visit companies_path
    click_link "Add a company"
    fill_in "Name", :with => 'New company'
    fill_in "Technologies", :with => "Ruby on Rails"
    click_on "Create Company"
    expect(page).to have_content "Companies"
  end
end
