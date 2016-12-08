class CreateOfficesAgain < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.references :company, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
