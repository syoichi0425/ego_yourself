class RenameDiariyContent0ToDiaryContent0InDiaries < ActiveRecord::Migration[7.0]
  def change

      rename_column :diaries, :diariy_content_0, :diary_content_0

  end
end
