class AddStartAtToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :start_at, :datetime
  end
end
