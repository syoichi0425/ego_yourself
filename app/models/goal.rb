class Goal < ApplicationRecord
  # これにより空のつぶやきができなくなります。
  #  validates :goal_content_0,:goal_content_1,:goal_content_2,:goal_content_3,:goal_content_4, presence: true

  belongs_to :user
  validates :user_id, presence: true
  # validates :goal_content_0, length: { minimum: 2 }
  validates :goal_content_0, presence: true

  MAX_GOALS_COUNT = 1

  belongs_to :user

  validate :goals_count_must_be_within_limit

  private

  def goals_count_must_be_within_limit
    # 未実装：更新時、設定したエラー表示がでるが、原因がわからない
    # errors.add(:base, "posts count limit: #{MAX_GOALS_COUNT}") if user.goals.count >= MAX_GOALS_COUNT
  end
end
