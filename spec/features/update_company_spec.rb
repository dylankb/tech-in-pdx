describe "the process of updating a company" do
  it "updates a company", js: true do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)
    click_on "TechInPDX"
    click_on 'New company'
    click_on 'Edit Details'
    fill_in "Name", :with => 'A new company name'
    click_on "Update Company"
    expect(page).to have_content "A new company name"
  end

  it "displays error when a field is missing" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)
    click_on "TechInPDX"
    click_on 'New company'
    click_on 'Edit Details'
    fill_in "Name", :with => ""
    click_on "Update Company"
    expect(page).to have_content "errors"
  end
end
