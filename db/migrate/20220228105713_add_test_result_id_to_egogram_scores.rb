class AddTestResultIdToEgogramScores < ActiveRecord::Migration[7.0]
  def change
    add_column :egogram_scores, :test_result_id, :integer
  end
end
