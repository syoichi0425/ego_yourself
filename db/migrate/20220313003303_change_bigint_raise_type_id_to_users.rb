class ChangeBigintRaiseTypeIdToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :raise_type_id, :bigint
  end
end
