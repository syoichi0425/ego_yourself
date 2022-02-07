class Goal < ApplicationRecord
# これにより空のつぶやきができなくなります。
#  validates :goal_content_0,:goal_content_1,:goal_content_2,:goal_content_3,:goal_content_4, presence: true

  belongs_to :user
  validates :user_id, presence: true


end