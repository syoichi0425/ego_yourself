class RenameTypeColumnToTestResults < ActiveRecord::Migration[7.0]
  def change
    rename_column :test_results, :type, :egogram_type
  end
end
