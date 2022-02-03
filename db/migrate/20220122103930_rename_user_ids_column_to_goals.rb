class RenameUserIdsColumnToGoals < ActiveRecord::Migration[7.0]
  def change
    rename_column :goals, :user_ids, :user_id
  end
end
