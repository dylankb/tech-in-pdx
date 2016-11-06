class DropTableCopmaniesLocations < ActiveRecord::Migration[5.0]
  def change
    drop_table :companies_locations
  end
end
