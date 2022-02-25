class AddUserIdToEgoscores < ActiveRecord::Migration[7.0]
  def change
    add_column :ego_scores,:user_id,:bigint
  end
end
