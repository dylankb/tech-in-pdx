class CreateJoinTableProfileTechnology < ActiveRecord::Migration[5.0]
  def change
    create_join_table :profiles, :technologies do |t|
      t.index [:profile_id, :technology_id]
      t.index [:technology_id, :profile_id]
    end
  end
end
