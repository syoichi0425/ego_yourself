class CreateWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :weeks do |t|
      t.text :week_0
      t.text :week_1
      t.text :week_2
      t.text :week_3
      t.text :week_4
      t.integer :user_id

      t.timestamps
    end
  end
end
