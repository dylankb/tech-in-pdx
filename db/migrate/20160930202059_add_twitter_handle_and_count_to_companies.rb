class AddTwitterHandleAndCountToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :twitter_handle, :string
    add_column :companies, :twitter_follower_count, :integer
  end
end
