class ChangeTrainingsDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default :companies, :trainings, from: true, to: false
    change_column_null :companies, :trainings, false
  end
end
