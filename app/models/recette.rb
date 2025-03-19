class Recette < ApplicationRecord
  # has_many :reviews, dependent: :destroy
  # has_many :users, through: :choix_recettes
  has_one_attached :photo

  AUTHORIZED_REPAS = ["Petit-déjeuner", "Déjeuner", "Dîner"]
  AUTHORIZED_DIFFICULTE = ["Facile", "Moyen", "Difficile"]

  validates :lipides, presence: true, numericality: { only_integer: true }
  validates :glucides, presence: true, numericality: { only_integer: true }
  validates :proteines, presence: true, numericality: { only_integer: true }
  validates :calories, presence: true, numericality: { only_integer: true }
  validates :ingredients, presence: true
  validates :repas_de_la_journee, presence: true, inclusion: { in: AUTHORIZED_REPAS }
  validates :tips, presence: true
  validates :instructions, presence: true
  validates :difficulte, presence: true, inclusion: { in: AUTHORIZED_DIFFICULTE }
  validates :temps_de_preparation, presence: true, numericality: { only_integer: true }
  validates :tags, presence: true
  validates :nom, presence: true
end
