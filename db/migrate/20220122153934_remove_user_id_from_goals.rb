class RemoveUserIdFromGoals < ActiveRecord::Migration[7.0]
  def change
    remove_column :goals, :user_id, :integer
  end
end
