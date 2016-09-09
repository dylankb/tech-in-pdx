class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :technologies, :string
      t.column :street_1, :string
      t.column :street_2, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :string

      t.timestamps
    end
  end
end
