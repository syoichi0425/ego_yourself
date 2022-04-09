class Diary < ApplicationRecord
  # validates :diary_content_0, presence: true

  belongs_to :user

  def start_time
    created_at # self.の後はsimple_calendarに表示させるためのカラムを指定
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
