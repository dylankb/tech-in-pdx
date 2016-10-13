class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :github_username
      t.integer :user_id
    end
  end
end
