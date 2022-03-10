class RenameRaiseTypeIdColumnToRaiseType < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :RaiseTypeId, :raise_type_id,
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
