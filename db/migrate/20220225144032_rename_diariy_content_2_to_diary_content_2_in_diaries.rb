class RenameDiariyContent2ToDiaryContent2InDiaries < ActiveRecord::Migration[7.0]
  def change
    rename_column :diaries, :diariy_content_2, :diary_content_2
  end
end
