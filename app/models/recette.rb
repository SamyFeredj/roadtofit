class Recette < ApplicationRecord
  # has_many :reviews, dependent: :destroy
  # has_many :users, through: :choix_recettes
  has_many :choix_recettes, dependent: :destroy
  has_many :users, through: :choix_recettes
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  AUTHORIZED_REPAS = ["Petit-déjeuner", "Déjeuner", "Dîner", "Dessert"]
  AUTHORIZED_DIFFICULTE = ["Facile", "Moyen", "Difficile"]
  AUTHORIZED_NOTES = (1..5)

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
  validates :note_globale, inclusion: { in: AUTHORIZED_NOTES }, allow_nil: true
end
