class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :user_id, presence: true
  validates :contenu, length: { maximum: 140 }
  validates :total_likes, presence: true, numericality: { only_integer: true }

end
