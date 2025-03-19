require 'json'
require 'open-uri'

# Cleaning database
print "Cleaning database..."
if Rails.env == "development"
  print "> Cleaning database..."

  Recette.destroy_all
  User.destroy_all

  puts "OK"
end

# Generating database
print "Generating database"
img_recette1 = "https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2F304x304%2Frecipes%2FwcQhjbOgzWIljQ.png&w=1024&q=100"
img_recette2 = "https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2F304x304%2Frecipes%2FXytiCjU39g1NkQ.png&w=1024&q=100"

# ===== Users generation
print "> User 1..."
u1 = User.new(prenom: "Samy", nom: "Feredj", email: "samyferedj@outlook.fr", pseudo: "samydrate", poids: 90.2, taille: 194, age: 24, sexe: "Homme", objectif_physique: "Prise de muscle", password: "password")
u1.save!
puts "OK"
#
print "> User 2..."
u2 = User.new(prenom: "Marcus", nom: "Meyer", email: "marcusmeyer@yahoo.fr", pseudo: "marcouss", poids: 80, taille: 191, age: 18, sexe: "Homme", objectif_physique: "Maintien", password: "password")
u2.save!
puts "OK"
#
print "> User 3..."
u3 = User.new(prenom: "Arli", nom: "Sefgjini", email: "arlisefgjini@outlook.com", pseudo: "arlicoptere", poids: 60, taille: 130, age: 39, sexe: "Homme", objectif_physique: "Prise de muscle", password: "password")
u3.save!
puts "OK"
#
print "> User 4..."
u4 = User.new(prenom: "Laurent", nom: "Millet", email: "laurentmillet@hotmail.fr", pseudo: "loron", poids: 159, taille: 169, age: 42, sexe: "Homme", objectif_physique: "Perte de poids", password: "password")
u4.save!
puts "OK"

# ===== Recettes generation

print "> Recette 1..."
recette1 = Recette.new(nom: "Chirashi au saumon et avocat", lipides: 29, glucides: 65, proteines: 34, calories: 757, ingredients: "70g Riz (à sushi), 1 Saumon cru, 1/2 Avocat, 1 càs Vinaigre de riz, 1 càc Sucre, 1 càs Sauce soja salée, 1 càc Graines de sésame, 1/4 bou. Ciboulettes", repas_de_la_journee: "Déjeuner", tips: "Avec des édamamés en plus, c'est top!",
instructions:
"Étape 1 : Faites décongeler les filets de saumon (si vous utilisez du saumon frais, pensez à le surgeler avant de réaliser la recette). Rincez le riz à sushi plusieurs fois à l'eau claire, puis faites-le cuire selon les indications du paquet.
Étape 2 : Pendant ce temps, enlevez la peau du saumon puis coupez-le en cubes.
Étape 3 : Dans un bol, ajoutez le saumon et la sauce soja. Mélangez et réservez.
Étape 4 : Préparez le vinaigre pour le riz à sushi. Dans un bol, mélangez : le vinaigre de riz, le sucre et une pincée de sel.
Étape 5 : Une fois le riz cuit, transvasez-le dans un plat, pour qu'il refroidisse. Ajoutez le mélange vinaigre de riz/sucre et mélangez le tout délicatement.
Étape 6 : Coupez l'avocat en deux. Retirez la peau, puis coupez-le en cubes.
Étape 7 : Servez le riz dans un bol ou une assiette creuse. Ajoutez le saumon mariné et l'avocat par-dessus. Parsemez de ciboulette ciselée et de graines de sésame, si vous en avez. C'est prêt !",
difficulte: "Facile", temps_de_preparation: 15, tags: "Japonais")
recette1.photo.attach(io: URI.open(img_recette1), filename: 'recette1.png', content_type: 'image/png')
recette1.save!
puts "OK"
#
print "> Recette 2..."
recette2 = Recette.new(nom: "Spicy Tuna Bowl", lipides: 18, glucides: 68, proteines: 21, calories: 526, ingredients: "70g Riz (à sushi), 50 g Thon naturel, 100 g Concombre, 2 càc Mayonnaise, 1 càc Sauce Piment, 1 càc Oignons frits, 10 ml Vinaigre de Riz, 1 càc Sucre, 1 Algues Nori", repas_de_la_journee: "Déjeuner", tips: "Avec des édamamés en plus, c'est top!",
instructions:
"Étape 1 : Rincez le riz à sushi plusieurs fois à l'eau claire, puis faites-le cuire selon les indications du paquet.
Étape 2 : Pendant ce temps, lavez puis coupez le concombre en cubes.
Étape 3 : Préparez la garniture. Dans un bol, mélangez : le thon égoutté, la mayonnaise et la sauce piquante.
Étape 4 : Coupez les feuilles d'algues nori en petites lamelles.
Étape 5 : Préparez le vinaigre pour le riz à sushi. Dans un bol, mélangez : le vinaigre de riz, le sucre et une pincée de sel.
Étape 6 : Une fois le riz cuit, transvasez-le dans un plat, pour qu'il refroidisse. Ajoutez le mélange vinaigre de riz/sucre et mélangez le tout délicatement.
Étape 7 : Servez le riz dans un bol ou une assiette creuse. Ajoutez le thon spicy, le concombre et les algues nori. Parsemez d'oignons frits et de graines de sésame, si vous en avez. C'est prêt !",
difficulte: "Facile", temps_de_preparation: 15, tags: "Japonais")
recette2.photo.attach(io: URI.open(img_recette2), filename: 'recette2.png', content_type: 'image/png')
recette2.save!
puts "OK"

# ===== End of generation
puts "#{User.count} Users generated successfully"
puts "#{Recette.count} Recettes generated successfully"
