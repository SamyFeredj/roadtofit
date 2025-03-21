class Review < ApplicationRecord
  belongs_to :recette
  belongs_to :user

  validates :commentaire, presence: true, length: { minimum: 10 }
  validates :note, presence: true, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
