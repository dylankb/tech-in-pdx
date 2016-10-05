class AddAdditionalTwitterProfileApiInformationToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :website, :string
    add_column :companies, :profile_banner_uri, :string
    add_column :companies, :profile_image_uri, :string
  end
end
