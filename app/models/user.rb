class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :commentaires, dependent: :destroy
  has_many :choix_recettes, dependent: :destroy
  has_many :recettes, through: :choix_recettes
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  REGIMES_ALIMENTAIRES = ["Végétarien", "Halal", "Vegan"]
  OBJECTIFS_PHYSIQUES = ["Prise de muscle", "Perte de poids", "Maintien"]
  SEXE = ["Homme", "Femme"]

  validates :nom, presence: true
  validates :prenom, presence: true, uniqueness: { scope: :nom }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :pseudo, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :poids, presence: true, numericality: true, comparison: { greater_than: 25 }
  validates :taille, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 0 }
  validates :age, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 14 }
  validates :sexe, presence: true, inclusion: { in: SEXE }
  validates :objectif_physique, presence: true
  validates :objectif_calorique, numericality: { only_integer: true }, allow_nil: true
  validates :regimes_alimentaires, inclusion: { in: REGIMES_ALIMENTAIRES }, allow_nil: true
end
