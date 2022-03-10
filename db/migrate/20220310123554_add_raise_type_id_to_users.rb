class AddRaiseTypeIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :RaiseTypeId, :integer
  end
end
