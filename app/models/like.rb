class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, uniqueness: { scope: :post_id }
  # like_flag == 0 => not liked
  # like_flag == 1 => liked
  validates :like_flag, presence: true, inclusion: { in: [0, 1] }
end
