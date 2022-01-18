class Contact < ApplicationRecord
# https://qiita.com/s_rkamot/items/d6d0e9abb43383342fd6
  validates :email, presence: true, length: {maximum:255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :message, presence: true
end
