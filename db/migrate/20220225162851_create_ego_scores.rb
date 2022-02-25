class CreateEgoScores < ActiveRecord::Migration[7.0]
  def change
    create_table :ego_scores do |t|
      t.integer :cp_score
      t.integer :np_score
      t.integer :a_score
      t.integer :fc_score
      t.integer :ac_score

      t.timestamps
    end
  end
end
