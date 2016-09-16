class RemoveAddressColumnsFromCompaniesModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :street_1, :string
    remove_column :companies, :street_2, :string
    remove_column :companies, :city, :string
    remove_column :companies, :state, :string
    remove_column :companies, :zip, :string
  end
end
