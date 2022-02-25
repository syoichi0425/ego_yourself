class RenameDiariyContent1ToDiaryContent1InDiaries < ActiveRecord::Migration[7.0]
  def change
    rename_column :diaries, :diariy_content_1, :diary_content_1
  end
end
