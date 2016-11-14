class AddTrainingsToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :trainings, :boolean, null: false, default: false
  end
end
