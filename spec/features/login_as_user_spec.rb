require 'rails_helper'

describe "log in a user process" do
  it "logs a user in", js: true do
    user = FactoryGirl.create(:user)

    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"
  end
end
