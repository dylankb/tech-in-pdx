class DropSimpleOfficesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :simple_offices
  end
end
