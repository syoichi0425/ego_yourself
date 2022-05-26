class Diary < ApplicationRecord
  # validates :diary_content_0, presence: true

  belongs_to :user

  def start_time
    created_at # self.の後はsimple_calendarに表示させるためのカラムを指定
  end


  def self.looks(search, word)
    if search == "perfect_match"
      @diary = Diary.where("diary_content_0 LIKE? or diary_content_1 LIKE? or diary_content_2 LIKE?", "#{word}","#{word}","#{word}")
    elsif search == "forward_match"
      @diary = Diary.where("diary_content_1 LIKE?","#{word}%")
    elsif search == "backward_match"
      @diary = Diary.where("diary_content_1 LIKE?","%#{word}")
    elsif search == "partial_match"
      @diary = Diary.where("diary_content_0 LIKE? or diary_content_1 LIKE? or diary_content_2 LIKE?","%#{word}%","%#{word}%","%#{word}%")
    else
      @diary = Diary.all
    end
  end


  validates :diary_content_0, presence: true

  MAX_DIARIES_COUNT = 100

  belongs_to :user

  validate :diaries_count_must_be_within_limit


  private

  def diaries_count_must_be_within_limit
    errors.add(:base, "posts count limit: #{MAX_DIARIES_COUNT}") if user.diaries.count >= MAX_DIARIES_COUNT
  end
end
