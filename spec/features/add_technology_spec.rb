require 'rails_helper'

describe "the adding a technology to a company process" do

  it "adds a technology", js: true do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)
    click_on "TechInPDX"

    click_on "New company"
    click_on "Add a Technology"
    fill_in "Name", :with => 'Amazing tech'
    click_on "Create Technology"
    expect(page).to have_content "New technology"
  end
end
