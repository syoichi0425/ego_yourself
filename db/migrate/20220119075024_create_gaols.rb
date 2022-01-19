class CreateGaols < ActiveRecord::Migration[7.0]
  def change
    create_table :gaols do |t|

      t.text :goal_content_0
      t.text :goal_content_1
      t.text :goal_content_2
      t.text :goal_content_3
      t.text :goal_content_4
      t.timestamps

    end
  end
end
