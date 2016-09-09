describe "the process of updating a company" do
  it "updates a company" do
    visit companies_path
    click_link "Add a company"
    fill_in "Name", :with => 'New company'
    fill_in "Technologies", :with => "Ruby on Rails"
    click_on "Create Company"

    visit admin_index_path
    click_on 'Edit'
    fill_in "Name", :with => 'A new company name'
    click_on "Update Company"
    expect(page).to have_content "A new company name"
  end

  it "displays error when a field is missing" do
    visit companies_path
    click_link "Add a company"
    fill_in "Name", :with => 'New company'
    fill_in "Technologies", :with => "Ruby on Rails"
    click_on "Create Company"

    visit admin_index_path
    click_on 'Edit'
    fill_in "Name", :with => ""
    click_on "Update Company"
    expect(page).to have_content "errors"
  end
end
