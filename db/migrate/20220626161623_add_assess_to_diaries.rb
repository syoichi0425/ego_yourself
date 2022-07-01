class AddAssessToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :assess, :integer
  end
end
