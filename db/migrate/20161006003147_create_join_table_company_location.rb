class CreateJoinTableCompanyLocation < ActiveRecord::Migration[5.0]
  def change
    create_join_table :companies, :locations do |t|
      t.index [:company_id, :location_id]
      t.index [:location_id, :company_id]
    end
  end
end
