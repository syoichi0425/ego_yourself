class Diary < ApplicationRecord
  def start_time
    self.created_at #self.の後はsimple_calendarに表示させるためのカラムを指定
  end
end
