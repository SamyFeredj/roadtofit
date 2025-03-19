if Rails.env == "development"
  print "> Cleaning database..."

  User.destroy_all

  puts "OK"
end

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

# ===== End of generation
puts "#{User.count} Users generated successfully"
