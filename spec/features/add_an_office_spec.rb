describe "adding an office to a company do" do
  it "adds an office" do

    # Log-in
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    company = FactoryGirl.create(:company)

    click_on "TechInPDX"
    click_on "Edit"
    click_on "Add an Office"
    fill_in "City", :with => "Portland"
    fill_in "State", :with => "OR"
    click_on "Create Office"
    expect(page).to have_content "New office saved!"
  end
end
