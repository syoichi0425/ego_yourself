class AddUserIdToGaols < ActiveRecord::Migration[7.0]
  def change
    add_column :gaols, :user_ids, :integer
  end
end
