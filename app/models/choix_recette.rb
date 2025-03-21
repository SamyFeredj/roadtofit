class ChoixRecette < ApplicationRecord
  belongs_to :user
  belongs_to :recette
  validates :date, presence: true
end
