class AddTestResultIdToEgoScores < ActiveRecord::Migration[7.0]
  def change
    add_column :ego_scores, :test_result_id, :integer
  end
end
