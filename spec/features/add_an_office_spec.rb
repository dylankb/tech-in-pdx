describe "adding an office to a company do" do
  it "adds an office" do

    # Log-in
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)
    office = FactoryGirl.build(:office)

    click_on "TechInPDX"
    click_on "New company"
    click_on "Edit"
    click_on "Add an Office"
    fill_in "City", :with => office.city
    fill_in "State", :with => office.state
    click_on "Create Office"
    expect(page).to have_content "New office saved!"
  end

  it "receives error creating blank office" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)

    click_on "TechInPDX"
    click_on "New company"
    click_on "Edit"
    click_on "Add an Office"
    fill_in "City", :with => ""
    fill_in "State", :with => ""
    click_on "Create Office"

    expect(page).to have_content "errors"
  end
end
