class RenameWeaknesToTestResults < ActiveRecord::Migration[7.0]
  def change
    rename_column :test_results, :weaknes, :weakness

  end
end
