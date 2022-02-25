class CreateEgogramScores < ActiveRecord::Migration[7.0]
  def change
    create_table :egogram_scores do |t|
      t.integer :fc_score
      t.integer :ac_score
      t.integer :a_score
      t.integer :ac_score
      t.integer :fc_score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
