class RemoveDiariesColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :diaries,:objective_0, :text
    remove_column :diaries,:objective_1, :text
    remove_column :diaries,:objective_2, :text
    remove_column :diaries,:objective_3, :text
    remove_column :diaries,:objective_4, :text
    remove_column :diaries,:start_at,    :datetime
    remove_column :diaries,:start_time,  :datetime
  end
end
