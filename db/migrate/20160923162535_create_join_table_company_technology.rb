class CreateJoinTableCompanyTechnology < ActiveRecord::Migration[5.0]
  def change
    create_join_table :companies, :technologies do |t|
      t.index [:company_id, :technology_id]
      t.index [:technology_id, :company_id]
    end
  end
end
