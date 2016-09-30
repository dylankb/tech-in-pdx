describe "the process of updating a company in the admin panel" do
  it "updates a company", js: true do
    company = FactoryGirl.create(:company)

    visit admin_index_path
    click_on 'New company'
    click_on 'Edit Name & Description'
    fill_in "Name", :with => 'A new company name'
    click_on "Update Company"
    expect(page).to have_content "A new company name"
  end

  it "displays error when a field is missing" do
    company = FactoryGirl.create(:company)

    visit admin_index_path
    click_on 'New company'
    click_on 'Edit Name & Description'
    fill_in "Name", :with => ""
    click_on "Update Company"
    expect(page).to have_content "errors"
  end
end
