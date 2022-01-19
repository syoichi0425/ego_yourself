class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.text :diariy_content_0
      t.text :diariy_content_1
      t.text :diariy_content_2
      t.text :objective_0
      t.text :objective_1
      t.text :objective_2
      t.text :objective_3
      t.text :objective_4

      t.timestamps
    end
  end
end
