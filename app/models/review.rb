class Review < ApplicationRecord
  belongs_to :recette
  belongs_to :user

  AUTHORIZED_RATINGS = (1..5)

  validates :commentaire, presence: true
  validates :note, presence: true, inclusion: { in: AUTHORIZED_RATINGS }, numericality: { only_integer: true }
end
