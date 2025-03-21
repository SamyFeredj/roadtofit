require 'json'
require 'open-uri'

# Cleaning database
if Rails.env == "development"
  print "> Cleaning database..."

  Recette.destroy_all
  Post.destroy_all
  User.destroy_all
  Commentaire.destroy_all

  puts "OK"
end

# Generating database
puts "> Generating database..."

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

puts " ===== "
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
#
liens = [
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551329/spaghetti_carbonara_y6jbde.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551329/lasagnes_%C3%A0_la_bolognaise_vue_de_haut_rxxfut.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551329/boeuf_bourguignon_evqbgi.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551329/Pancakes_bor9gj.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551330/Tiramisu_u7yic5.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551330/Quiche_Lorraine_hazvmi.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551330/Poulet_au_curry_jfiui7.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551329/plat_ratatouille_avec_des_l%C3%A9gumes_coup%C3%A9s_en_quinconce_horizontal_dans_un_plat_ovale_g0wcvm.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742551329/Velout%C3%A9_orange_gnklav.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Omelette_aux_champignons_xslfwc.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Brownie_au_chocolat_vxsc3b.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Poulet_aux_patates_douces_et_brocolis_coup%C3%A9s_thai_d%C3%A9licieux_ibxnxq.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Saumon_riz_complet_et_haricots_verts_et_sauce_hollandaise_hzkhhg.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Bowl_prot%C3%A9in%C3%A9_au_quinoa_poulet_et_avocat_isuvjk.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/P%C3%A2tes_compl%C3%A8tes_au_thon_et_l%C3%A9gumes_mwsfou.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Patate_douce_farcie_au_poulet_ujrekc.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Gaufres_prot%C3%A9in%C3%A9es_%C3%A0_l_avoine_et_banane_vqhk5f.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Granola_maison_aux_amandes_et_noisettes_tuwiyr.jpg"
]
recettes = [
{:nom=>"Spaghetti Carbonara", :repas_de_la_journee=>"Dîner", :temps_de_preparation=>25, :difficulte=>"Moyen", :ingredients=>"Spaghetti (200g), Œufs (2), Lardons (100g), Parmesan (50g), Poivre (1 pincée), Sel (1 pincée).", :tips=>"Utilisez du guanciale au lieu des lardons pour une carbonara plus authentique !", :instructions=>"1. Faites cuire les spaghetti al dente.\n2. Faites revenir les lardons dans une poêle sans ajouter de matière grasse.\n3. Battez les œufs avec le parmesan râpé, salez et poivrez légèrement.\n4. Mélangez les pâtes avec les lardons hors du feu, puis incorporez le mélange aux œufs.\n5. Servez immédiatement avec du parmesan supplémentaire et du poivre.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Lasagnes à la bolognaise", :repas_de_la_journee=>"Dîner", :temps_de_preparation=>90, :difficulte=>"Moyen", :ingredients=>"Pâtes à lasagne (12 feuilles), Viande hachée (300g), Tomates concassées (400g), Oignon (1), Béchamel (300ml), Fromage râpé (100g).", :tips=>"Laissez reposer les lasagnes 10 minutes après cuisson pour qu'elles se tiennent mieux au service.", :instructions=>"1. Faites revenir l'oignon émincé et la viande hachée dans une poêle.\n2. Ajoutez les tomates concassées et laissez mijoter 30 minutes.\n3. Dans un plat, alternez des couches de pâtes, sauce bolognaise et béchamel.\n4. Saupoudrez de fromage râpé et enfournez à 180°C pendant 40 minutes.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Bœuf bourguignon", :repas_de_la_journee=>"Dîner", :temps_de_preparation=>180, :difficulte=>"Difficile", :ingredients=>"Bœuf (500g), Vin rouge (500ml), Carottes (2), Oignon (1), Lardons (150g), Champignons (200g).", :tips=>"Préparez-le la veille, il sera encore meilleur réchauffé.", :instructions=>"1. Faites revenir les morceaux de bœuf dans une cocotte.\n2. Ajoutez les oignons, carottes et lardons.\n3. Déglacez avec le vin rouge et laissez mijoter 3 heures.\n4. Ajoutez les champignons 30 minutes avant la fin de la cuisson.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Pancakes", :repas_de_la_journee=>"Petit-déjeuner", :temps_de_preparation=>30, :difficulte=>"Facile", :ingredients=>"Farine (250g), Œufs (2), Lait (300ml), Sucre (50g), Beurre (50g), Levure chimique (1 sachet).", :tips=>"Laissez reposer la pâte 10 minutes pour des pancakes plus moelleux.", :instructions=>"1. Mélangez la farine, la levure et le sucre dans un saladier.\n2. Ajoutez les œufs et le lait en fouettant jusqu'à obtenir une pâte homogène.\n3. Faites chauffer une poêle avec un peu de beurre.\n4. Versez une petite louche de pâte et laissez cuire 2 minutes de chaque côté.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Tiramisu", :repas_de_la_journee=>"Dessert", :temps_de_preparation=>240, :difficulte=>"Difficile", :ingredients=>"Mascarpone (250g), Œufs (3), Sucre (80g), Café (200ml), Biscuits cuillère (200g), Cacao (20g).", :tips=>"Préparez-le la veille pour qu'il ait le temps de bien s'imprégner des saveurs.", :instructions=>"1. Séparez les blancs des jaunes d'œufs.\n2. Battez les jaunes avec le sucre et ajoutez le mascarpone.\n3. Montez les blancs en neige et incorporez-les délicatement.\n4. Trempez les biscuits dans le café et disposez-les au fond d'un plat.\n5. Alternez une couche de crème au mascarpone et une couche de biscuits.\n6. Saupoudrez de cacao et réservez au réfrigérateur au moins 4 heures.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Quiche Lorraine", :repas_de_la_journee=>"Déjeuner", :temps_de_preparation=>45, :difficulte=>"Facile", :ingredients=>"Pâte brisée (1), Lardons (200g), Œufs (3), Crème fraîche (250ml), Gruyère râpé (100g), Sel (1 pincée), Poivre (1 pincée).", :tips=>"Ajoutez une pincée de muscade dans l'appareil pour plus de saveur.", :instructions=>"1. Préchauffez le four à 180°C.\n2. Faites revenir les lardons à la poêle sans matière grasse.\n3. Dans un bol, mélangez les œufs, la crème, le sel et le poivre.\n4. Étalez la pâte dans un moule et répartissez les lardons dessus.\n5. Versez l'appareil à quiche et saupoudrez de fromage râpé.\n6. Enfournez 35 minutes.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Poulet au curry", :repas_de_la_journee=>"Dîner", :temps_de_preparation=>40, :difficulte=>"Moyen", :ingredients=>"Blancs de poulet (300g), Oignon (1), Lait de coco (250ml), Curry en poudre (1 cuillère à soupe), Riz basmati (200g), Huile d'olive (1 cuillère à soupe).", :tips=>"Ajoutez une cuillère de miel pour un curry encore plus savoureux.", :instructions=>"1. Faites revenir l'oignon émincé dans l'huile d'olive.\n2. Ajoutez le poulet coupé en morceaux et faites dorer.\n3. Saupoudrez de curry et mélangez bien.\n4. Versez le lait de coco et laissez mijoter 20 minutes.\n5. Servez avec du riz basmati.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Ratatouille", :repas_de_la_journee=>"Déjeuner", :temps_de_preparation=>60, :difficulte=>"Facile", :ingredients=>"Courgettes (2), Aubergine (1), Poivrons (2), Tomates (4), Oignon (1), Huile d'olive (3 cuillères à soupe).", :tips=>"Laissez mijoter à feu doux pour une meilleure fusion des saveurs.", :instructions=>"1. Coupez tous les légumes en dés.\n2. Faites revenir l'oignon dans l'huile d'olive.\n3. Ajoutez les poivrons, puis l'aubergine et les courgettes.\n4. Incorporez les tomates et laissez mijoter 40 minutes.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Velouté de légumes", :repas_de_la_journee=>"Dîner", :temps_de_preparation=>45, :difficulte=>"Facile", :ingredients=>"Carottes (3), Pommes de terre (2), Poireaux (1), Oignon (1), Bouillon de légumes (1L).", :tips=>"Ajoutez une touche de crème pour plus d'onctuosité.", :instructions=>"1. Épluchez et coupez les légumes en morceaux.\n2. Faites-les revenir quelques minutes avec un peu d'huile d'olive.\n3. Versez le bouillon chaud et laissez cuire 30 minutes.\n4. Mixez et servez chaud.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Omelette aux champignons", :repas_de_la_journee=>"Petit-déjeuner", :temps_de_preparation=>15, :difficulte=>"Facile", :ingredients=>"Œufs (3), Champignons (100g), Crème fraîche (2 cuillères à soupe), Beurre (10g), Sel (1 pincée), Poivre (1 pincée).", :tips=>"Ajoutez du fromage râpé pour plus de gourmandise.", :instructions=>"1. Nettoyez et émincez les champignons.\n2. Faites-les revenir dans une poêle avec du beurre.\n3. Battez les œufs avec la crème, le sel et le poivre.\n4. Versez le mélange dans la poêle et laissez cuire à feu doux.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Brownie au chocolat protéiné", :repas_de_la_journee=>"Dessert", :temps_de_preparation=>35, :difficulte=>"Facile", :ingredients=>"Chocolat noir (200g), Beurre (100g), Sucre (150g), Œufs (3), Farine (100g), Noix (50g).", :tips=>"Ne faites pas trop cuire le brownie pour qu'il reste bien fondant.", :instructions=>"1. Faites fondre le chocolat et le beurre au bain-marie.\n2. Ajoutez le sucre, puis les œufs un à un.\n3. Incorporez la farine et les noix concassées.\n4. Versez dans un moule et enfournez à 180°C pendant 20 minutes.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Poulet aux patates douces et brocolis", :repas_de_la_journee=>"Déjeuner", :temps_de_preparation=>35, :difficulte=>"Facile", :ingredients=>"Blancs de poulet (200g), Patate douce (150g), Brocolis (100g), Huile d'olive (1 cuillère à soupe), Ail (1 gousse).", :tips=>"Ajoute du paprika et du citron pour rehausser le goût du poulet.", :instructions=>"1. Épluche et coupe la patate douce en dés, puis fais-la cuire à la vapeur.\n2. Fais revenir le poulet dans une poêle avec de l'huile et de l'ail.\n3. Ajoute les brocolis cuits et mélange le tout avant de servir.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Saumon, riz complet et haricots verts", :repas_de_la_journee=>"Dîner", :temps_de_preparation=>30, :difficulte=>"Facile", :ingredients=>"Saumon (150g), Riz complet (80g), Haricots verts (120g), Jus de citron (1 cuillère à soupe), Huile d'olive (1 cuillère à café).", :tips=>"Ajoute des graines de sésame pour une touche croquante.", :instructions=>"1. Fais cuire le riz complet et les haricots verts à la vapeur.\n2. Fais griller le saumon avec un filet de jus de citron.\n3. Assemble le tout et arrose d'un filet d'huile d'olive.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Bowl protéiné au quinoa, poulet et avocat", :repas_de_la_journee=>"Déjeuner", :temps_de_preparation=>25, :difficulte=>"Moyen", :ingredients=>"Quinoa (80g), Blanc de poulet (150g), Avocat (1/2), Tomates cerises (100g), Citron (1/2).", :tips=>"Ajoute des graines de chia ou de sésame pour un boost nutritionnel.", :instructions=>"1. Fais cuire le quinoa selon les instructions.\n2. Fais griller le poulet et coupe-le en morceaux.\n3. Assemble tous les ingrédients et ajoute du jus de citron.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Pâtes complètes au thon et légumes", :repas_de_la_journee=>"Dîner", :temps_de_preparation=>20, :difficulte=>"Facile", :ingredients=>"Pâtes complètes (100g), Thon naturel (120g), Courgette (100g), Tomates séchées (50g), Huile d'olive (1 cuillère à soupe).", :tips=>"Ajoute une pincée de parmesan pour plus de goût.", :instructions=>"1. Fais cuire les pâtes et réserve.\n2. Fais revenir les courgettes et les tomates séchées dans l'huile.\n3. Ajoute le thon, mélange avec les pâtes et sers chaud.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Patate douce farcie au poulet", :repas_de_la_journee=>"Déjeuner", :temps_de_preparation=>40, :difficulte=>"Moyen", :ingredients=>"Patate douce (1 grande), Blanc de poulet (150g), Fromage blanc 0% (50g), Ciboulette (1 cuillère à soupe), Ail (1 gousse).", :tips=>"Ajoute du curry dans la farce pour un goût épicé.", :instructions=>"1. Fais cuire la patate douce entière au four à 180°C pendant 35 min.\n2. Fais revenir le poulet haché avec de l'ail.\n3. Creuse la patate douce, mélange la chair avec le poulet et le fromage blanc.\n4. Remets la farce dans la patate et sers chaud.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Gaufres protéinées à l'avoine et banane", :repas_de_la_journee=>"Petit-déjeuner", :temps_de_preparation=>15, :difficulte=>"Facile", :ingredients=>"Flocons d'avoine (50g), Banane (1), Blancs d'œufs (2), Lait d'amande (50ml), Cannelle (1 pincée).", :tips=>"Ajoute un peu de beurre de cacahuète pour plus de protéines.", :instructions=>"1. Mixe tous les ingrédients ensemble.\n2. Verse la pâte dans un gaufrier chaud.\n3. Laisse cuire 3 à 5 minutes et sers avec des fruits.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10},
{:nom=>"Granola maison aux amandes et noisettes", :repas_de_la_journee=>"Petit-déjeuner", :temps_de_preparation=>40, :difficulte=>"Moyen", :ingredients=>"Flocons d'avoine (200g), Amandes (50g), Noisettes (50g), Miel (2 cuillères à soupe), Huile de coco (1 cuillère à soupe).", :tips=>"Ajoutez des pépites de chocolat noir après cuisson pour plus de gourmandise.", :instructions=>"1. Mélangez tous les ingrédients et étalez sur une plaque de cuisson.\n2. Faites cuire au four à 160°C pendant 30 minutes en remuant de temps en temps.\n3. Laissez refroidir avant de déguster.", :proteines=>10, :glucides=>10, :lipides=>10, :calories=>10}
]

recettes.each_with_index do |recette, index|
  print "> Recette #{index + 3}..."
  r = Recette.new(recette)
  r.tags = "Default"
  r.photo.attach(io: URI.open(liens[index]), filename: "recette#{index + 3}.jpg", content_type: 'image/jpg')
  r.save!
  puts "OK"
end


puts " ===== "
# ===== Posts generation
print "> Post 1..."
p1 = Post.new(contenu: "Salut tout le monde, je suis nouveau sur l'application, j'espère que vous allez bien !", user: u1, total_likes: 0)
p1.save!
puts "OK"
#
print "> Post 2..."
p2 = Post.new(contenu: "Je viens de tester la recette de chirashi au saumon et avocat, c'était délicieux !", user: u1, total_likes: 0)
p2.save!
puts "OK"
#

puts " ===== "
# ===== Likes generation
count = 0
[u1, u2, u3, u4].each_with_index do |user, u_index|
  [p1, p2].each_with_index do |post, p_index|
    count += 1
    print "Like n°#{count} : user#{u_index + 1} | post#{p_index + 1}..."
    like_i = Like.new(user: user, post: post, like_flag: 0)
    like_i.save!
    puts "OK"
  end
end

puts " ===== "
# ===== Commentaires generation
print "> Commentaire 1..."
c1 = Commentaire.new(post: p1, user: u2, content: "Bienvenue dans la commu RoadToFit !")
c1.save!
puts "OK"
#
print "> Commentaire 2..."
c2 = Commentaire.new(post: p1, user: u3, content: "Et un de plus dans la team, génial !")
c2.save!
puts "OK"
#
print "> Commentaire 3..."
c3 = Commentaire.new(post: p2, user: u4, content: "J'avais envie de tester cette recette depuis longtemps. C'est décidé, ce midi je me lance !")
c3.save!
puts "OK"

puts " ===== "

# ===== End of generation
puts "#{User.count} Users generated successfully"
puts "#{Recette.count} Recettes generated successfully"
puts "#{Post.count} Posts generated successfully"
puts "#{Like.count} Likes generated successfully"
puts "#{Commentaire.count} Commentaires generated successfully"
