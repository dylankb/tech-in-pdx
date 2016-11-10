class CreateSimpleOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :simple_offices do |t|
      t.string :office_type
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :company_id

      t.timestamps
    end
  end
end
