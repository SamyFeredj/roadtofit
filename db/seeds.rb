require 'json'
require 'open-uri'

# Cleaning database
if Rails.env == "development" || Rails.env == "production"
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
u1.photo.attach(io: URI.open("https://res.cloudinary.com/dgxnurfcj/image/upload/v1743102657/samy_of85uf.jpg"), filename: 'samy.jpeg', content_type: 'image/png')
u1.save!
puts "OK"
#
print "> User 2..."
u2 = User.new(prenom: "Marcus", nom: "Meyer", email: "marcusmeyer@yahoo.fr", pseudo: "marcouss", poids: 80, taille: 191, age: 18, sexe: "Homme", objectif_physique: "Maintien", password: "password")
u2.photo.attach(io: URI.open("https://res.cloudinary.com/dgxnurfcj/image/upload/v1743102638/marcus_lybqcl.png"), filename: 'marcus.png', content_type: 'image/png')
u2.save!
puts "OK"
#
print "> User 3..."
u3 = User.new(prenom: "Arli", nom: "Sefgjini", email: "arlisefgjini@outlook.com", pseudo: "arlicoptere", poids: 103, taille: 183, age: 26, sexe: "Homme", objectif_physique: "Perte de poids", password: "password")
u3.photo.attach(io: URI.open("https://res.cloudinary.com/dgxnurfcj/image/upload/v1743102640/arli_upwlxd.png"), filename: 'arli.png', content_type: 'image/png')
u3.save!
puts "OK"
#
print "> User 4..."
u4 = User.new(prenom: "Laurent", nom: "Millet", email: "laurentmillet@hotmail.fr", pseudo: "loron", poids: 159, taille: 169, age: 42, sexe: "Homme", objectif_physique: "Perte de poids", password: "password")
u4.photo.attach(io: URI.open("https://res.cloudinary.com/dgxnurfcj/image/upload/v1743102639/laurent_jx3xmf.png"), filename: 'laurent.png', content_type: 'image/png')
u4.save!
puts "OK"
#
print "> User 5..."
u5 = User.new(prenom: "Élise", nom: "Dupont", email: "elisedupont@hotmail.fr", pseudo: "lison", poids: 105, taille: 150, age: 32, sexe: "Femme", objectif_physique: "Perte de poids", password: "password")
u5.photo.attach(io: URI.open("https://res.cloudinary.com/dz52azagy/image/upload/v1744189552/Elise-Dupont-viool-_C2_A9Foppe-Schut_hpghgo.jpg"), filename: 'elise.jpg', content_type: 'image/jpg')
u5.save!
puts "OK"
#
print "> User 6..."
u6 = User.new(prenom: "Sophie", nom: "Martin", email: "sophiemartin@hotmail.fr", pseudo: "soso", poids: 65, taille: 176, age: 38, sexe: "Femme", objectif_physique: "Prise de muscle", password: "password")
u6.photo.attach(io: URI.open("https://res.cloudinary.com/dz52azagy/image/upload/v1744189842/headshot_sophiemartin_-_sophie_martin_iprzap.jpg"), filename: 'sophie.jpg', content_type: 'image/jpg')
u6.save!
puts "OK"
#
print "> User 7..."
u7 = User.new(prenom: "Camille", nom: "Lefevre", email: "camillelefevre@hotmail.fr", pseudo: "camillon", poids: 80, taille: 180, age: 29, sexe: "Femme", objectif_physique: "Perte de pods", password: "password")
u7.photo.attach(io: URI.open("https://res.cloudinary.com/dz52azagy/image/upload/v1744190006/1695113469584_qreuog.jpg"), filename: 'camille.png', content_type: 'image/jpg')
u7.save!
puts "OK"
#
print "> User 8..."
u8 = User.new(prenom: "Aminata", nom: "Kanouté", email: "aminatakanoute@hotmail.fr", pseudo: "mimi", poids: 59, taille: 169, age: 50, sexe: "Femme", objectif_physique: "Prise de muscle", password: "password")
u8.photo.attach(io: URI.open("https://res.cloudinary.com/dz52azagy/image/upload/v1744190203/1692359667979_uthlh6.jpg"), filename: 'aminata.jpg', content_type: 'image/jpg')
u8.save!
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
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1742552726/Granola_maison_aux_amandes_et_noisettes_tuwiyr.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/wrap-poulet-et-crudites_obbd1k.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/bol-tofu-legumes-nouilles-riz_t2bysn.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136917/Pudding-de-chia-au-lait-de-coco-et-mangue-1024x691_v0m7lu.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136919/velout%C3%A9-lentilles-corail_d5mcnv.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/image_0651923_20230823_ob_16c9c3_salade-pois-chiches_e7cvto.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/i198568-_hhhsvk.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/buddha-bowl-tag-AdobeStock_167548605_qp2kgw.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/1570726712TOME2_VEGETARIENNE_26072018_DEF_DEF_BF_Page_60_mybkat.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/Riz_de_chou-fleur_saut%C3%A9_au_thon_rutv9p.jpg",
  "https://res.cloudinary.com/dgxnurfcj/image/upload/v1744136918/IMG_0067-1-1536x1024_gg2snh.jpg"
]
recettes = [
  {
    :nom=>"Spaghetti Carbonara",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>25,
    :difficulte=>"Moyen",
    :ingredients=>"Spaghetti (200g), Œufs (2), Lardons (100g), Parmesan (50g), Poivre (1 pincée), Sel (1 pincée).",
    :tips=>"Utilisez du guanciale au lieu des lardons pour une carbonara plus authentique !",
    :instructions=>"1. Faites cuire les spaghetti al dente.\n2. Faites revenir les lardons dans une poêle sans ajouter de matière grasse.\n3. Battez les œufs avec le parmesan râpé, salez et poivrez légèrement.\n4. Mélangez les pâtes avec les lardons hors du feu, puis incorporez le mélange aux œufs.\n5. Servez immédiatement avec du parmesan supplémentaire et du poivre.",
    :proteines=>39,
    :glucides=>122,
    :lipides=>52,
    :calories=>740
  },
  {
    :nom=>"Lasagnes à la bolognaise",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>90,
    :difficulte=>"Moyen",
    :ingredients=>"Pâtes à lasagne (12 feuilles), Viande hachée (300g), Tomates concassées (400g), Oignon (1), Béchamel (300ml), Fromage râpé (100g).",
    :tips=>"Laissez reposer les lasagnes 10 minutes après cuisson pour qu'elles se tiennent mieux au service.",
    :instructions=>"1. Faites revenir l'oignon émincé et la viande hachée dans une poêle.\n2. Ajoutez les tomates concassées et laissez mijoter 30 minutes.\n3. Dans un plat, alternez des couches de pâtes, sauce bolognaise et béchamel.\n4. Saupoudrez de fromage râpé et enfournez à 180°C pendant 40 minutes.",
    :proteines=>56,
    :glucides=>70,
    :lipides=>62,
    :calories=>683
  },
  {
    :nom=>"Bœuf bourguignon",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>180,
    :difficulte=>"Difficile",
    :ingredients=>"Bœuf (500g), Vin rouge (500ml), Carottes (2), Oignon (1), Lardons (150g), Champignons (200g).",
    :tips=>"Préparez-le la veille, il sera encore meilleur réchauffé.",
    :instructions=>"1. Faites revenir les morceaux de bœuf dans une cocotte.\n2. Ajoutez les oignons, carottes et lardons.\n3. Déglacez avec le vin rouge et laissez mijoter 3 heures.\n4. Ajoutez les champignons 30 minutes avant la fin de la cuisson.",
    :proteines=>80,
    :glucides=>15,
    :lipides=>60,
    :calories=>650
  },
  {
    :nom=>"Pancakes",
    :repas_de_la_journee=>"Petit-déjeuner",
    :temps_de_preparation=>30,
    :difficulte=>"Facile",
    :ingredients=>"Farine (250g), Œufs (2), Lait (300ml), Sucre (50g), Beurre (50g), Levure chimique (1 sachet).",
    :tips=>"Laissez reposer la pâte 10 minutes pour des pancakes plus moelleux.",
    :instructions=>"1. Mélangez la farine, la levure et le sucre dans un saladier.\n2. Ajoutez les œufs et le lait en fouettant jusqu'à obtenir une pâte homogène.\n3. Faites chauffer une poêle avec un peu de beurre.\n4. Versez une petite louche de pâte et laissez cuire 2 minutes de chaque côté.",
    :proteines=>23,
    :glucides=>140,
    :lipides=>35,
    :calories=>686
  },
  {
    :nom=>"Tiramisu",
    :repas_de_la_journee=>"Dessert",
    :temps_de_preparation=>240,
    :difficulte=>"Difficile",
    :ingredients=>"Mascarpone (250g), Œufs (3), Sucre (80g), Café (200ml), Biscuits cuillère (200g), Cacao (20g).",
    :tips=>"Préparez-le la veille pour qu'il ait le temps de bien s'imprégner des saveurs.",
    :instructions=>"1. Séparez les blancs des jaunes d'œufs.\n2. Battez les jaunes avec le sucre et ajoutez le mascarpone.\n3. Montez les blancs en neige et incorporez-les délicatement.\n4. Trempez les biscuits dans le café et disposez-les au fond d'un plat.\n5. Alternez une couche de crème au mascarpone et une couche de biscuits.\n6. Saupoudrez de cacao et réservez au réfrigérateur au moins 4 heures.",
    :proteines=>24,
    :glucides=>95,
    :lipides=>70,
    :calories=>646
  },
  {
    :nom=>"Quiche Lorraine",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>45,
    :difficulte=>"Facile",
    :ingredients=>"Pâte brisée (1), Lardons (200g), Œufs (3), Crème fraîche (250ml), Gruyère râpé (100g), Sel (1 pincée), Poivre (1 pincée).",
    :tips=>"Ajoutez une pincée de muscade dans l'appareil pour plus de saveur.",
    :instructions=>"1. Préchauffez le four à 180°C.\n2. Faites revenir les lardons à la poêle sans matière grasse.\n3. Dans un bol, mélangez les œufs, la crème, le sel et le poivre.\n4. Étalez la pâte dans un moule et répartissez les lardons dessus.\n5. Versez l'appareil à quiche et saupoudrez de fromage râpé.\n6. Enfournez 35 minutes.",
    :proteines=>38,
    :glucides=>32,
    :lipides=>70,
    :calories=>633
  },
  {
    :nom=>"Poulet au curry",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>40,
    :difficulte=>"Moyen",
    :ingredients=>"Blancs de poulet (300g), Oignon (1), Lait de coco (250ml), Curry en poudre (1 cuillère à soupe), Riz basmati (200g), Huile d'olive (1 cuillère à soupe).",
    :tips=>"Ajoutez une cuillère de miel pour un curry encore plus savoureux.",
    :instructions=>"1. Faites revenir l'oignon émincé dans l'huile d'olive.\n2. Ajoutez le poulet coupé en morceaux et faites dorer.\n3. Saupoudrez de curry et mélangez bien.\n4. Versez le lait de coco et laissez mijoter 20 minutes.\n5. Servez avec du riz basmati.",
    :proteines=>55,
    :glucides=>70,
    :lipides=>45,
    :calories=>546
  },
  {
    :nom=>"Ratatouille",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>60,
    :difficulte=>"Facile",
    :ingredients=>"Courgettes (2), Aubergine (1), Poivrons (2), Tomates (4), Oignon (1), Huile d'olive (3 cuillères à soupe).",
    :tips=>"Laissez mijoter à feu doux pour une meilleure fusion des saveurs.",
    :instructions=>"1. Coupez tous les légumes en dés.\n2. Faites revenir l'oignon dans l'huile d'olive.\n3. Ajoutez les poivrons, puis l'aubergine et les courgettes.\n4. Incorporez les tomates et laissez mijoter 40 minutes.",
    :proteines=>6,
    :glucides=>18,
    :lipides=>27,
    :calories=>345
  },
  {
    :nom=>"Velouté de légumes",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>45,
    :difficulte=>"Facile",
    :ingredients=>"Carottes (3), Pommes de terre (2), Poireaux (1), Oignon (1), Bouillon de légumes (1L).",
    :tips=>"Ajoutez une touche de crème pour plus d'onctuosité.",
    :instructions=>"1. Épluchez et coupez les légumes en morceaux.\n2. Faites-les revenir quelques minutes avec un peu d'huile d'olive.\n3. Versez le bouillon chaud et laissez cuire 30 minutes.\n4. Mixez et servez chaud.",
    :proteines=>5,
    :glucides=>32,
    :lipides=>4,
    :calories=>210
  },
  {
    :nom=>"Omelette aux champignons",
    :repas_de_la_journee=>"Petit-déjeuner",
    :temps_de_preparation=>15,
    :difficulte=>"Facile",
    :ingredients=>"Œufs (3), Champignons (100g), Crème fraîche (2 cuillères à soupe), Beurre (10g), Sel (1 pincée), Poivre (1 pincée).",
    :tips=>"Ajoutez du fromage râpé pour plus de gourmandise.",
    :instructions=>"1. Nettoyez et émincez les champignons.\n2. Faites-les revenir dans une poêle avec du beurre.\n3. Battez les œufs avec la crème, le sel et le poivre.\n4. Versez le mélange dans la poêle et laissez cuire à feu doux.",
    :proteines=>20,
    :glucides=>3,
    :lipides=>22,
    :calories=>290
  },
  {
    :nom=>"Brownie au chocolat protéiné",
    :repas_de_la_journee=>"Dessert",
    :temps_de_preparation=>35,
    :difficulte=>"Facile",
    :ingredients=>"Chocolat noir (200g), Beurre (100g), Sucre (150g), Œufs (3), Farine (100g), Noix (50g).",
    :tips=>"Ne faites pas trop cuire le brownie pour qu'il reste bien fondant.",
    :instructions=>"1. Faites fondre le chocolat et le beurre au bain-marie.\n2. Ajoutez le sucre, puis les œufs un à un.\n3. Incorporez la farine et les noix concassées.\n4. Versez dans un moule et enfournez à 180°C pendant 20 minutes.",
    :proteines=>18,
    :glucides=>62,
    :lipides=>48,
    :calories=>467
  },
  {
    :nom=>"Poulet aux patates douces et brocolis",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>35,
    :difficulte=>"Facile",
    :ingredients=>"Blancs de poulet (200g), Patate douce (150g), Brocolis (100g), Huile d'olive (1 cuillère à soupe), Ail (1 gousse).",
    :tips=>"Ajoute du paprika et du citron pour rehausser le goût du poulet.",
    :instructions=>"1. Épluche et coupe la patate douce en dés, puis fais-la cuire à la vapeur.\n2. Fais revenir le poulet dans une poêle avec de l'huile et de l'ail.\n3. Ajoute les brocolis cuits et mélange le tout avant de servir.",
    :proteines=>42,
    :glucides=>28,
    :lipides=>12,
    :calories=>420
  },
  {
    :nom=>"Saumon, riz complet et haricots verts",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>30,
    :difficulte=>"Facile",
    :ingredients=>"Saumon (150g), Riz complet (80g), Haricots verts (120g), Jus de citron (1 cuillère à soupe), Huile d'olive (1 cuillère à café).",
    :tips=>"Ajoute des graines de sésame pour une touche croquante.",
    :instructions=>"1. Fais cuire le riz complet et les haricots verts à la vapeur.\n2. Fais griller le saumon avec un filet de jus de citron.\n3. Assemble le tout et arrose d'un filet d'huile d'olive.",
    :proteines=>34,
    :glucides=>38,
    :lipides=>16,
    :calories=>490
  },
  {
    :nom=>"Bowl protéiné au quinoa, poulet et avocat",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>25,
    :difficulte=>"Moyen",
    :ingredients=>"Quinoa (80g), Blanc de poulet (150g), Avocat (1/2), Tomates cerises (100g), Citron (1/2).",
    :tips=>"Ajoute des graines de chia ou de sésame pour un boost nutritionnel.",
    :instructions=>"1. Fais cuire le quinoa selon les instructions.\n2. Fais griller le poulet et coupe-le en morceaux.\n3. Assemble tous les ingrédients et ajoute du jus de citron.",
    :proteines=>38,
    :glucides=>30,
    :lipides=>20,
    :calories=>470
  },
  {
    :nom=>"Pâtes complètes au thon et légumes",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>20,
    :difficulte=>"Facile",
    :ingredients=>"Pâtes complètes (100g), Thon naturel (120g), Courgette (100g), Tomates séchées (50g), Huile d'olive (1 cuillère à soupe).",
    :tips=>"Ajoute une pincée de parmesan pour plus de goût.",
    :instructions=>"1. Fais cuire les pâtes et réserve.\n2. Fais revenir les courgettes et les tomates séchées dans l'huile.\n3. Ajoute le thon, mélange avec les pâtes et sers chaud.",
    :proteines=>35,
    :glucides=>45,
    :lipides=>16,
    :calories=>520
  },
  {
    :nom=>"Patate douce farcie au poulet",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>40,
    :difficulte=>"Moyen",
    :ingredients=>"Patate douce (1 grande), Blanc de poulet (150g), Fromage blanc 0% (50g), Ciboulette (1 cuillère à soupe), Ail (1 gousse).",
    :tips=>"Ajoute du curry dans la farce pour un goût épicé.",
    :instructions=>"1. Fais cuire la patate douce entière au four à 180°C pendant 35 min.\n2. Fais revenir le poulet haché avec de l'ail.\n3. Creuse la patate douce, mélange la chair avec le poulet et le fromage blanc.\n4. Remets la farce dans la patate et sers chaud.",
    :proteines=>38,
    :glucides=>40,
    :lipides=>6,
    :calories=>430
  },
  {
    :nom=>"Gaufres protéinées à l'avoine et banane",
    :repas_de_la_journee=>"Petit-déjeuner",
    :temps_de_preparation=>15,
    :difficulte=>"Facile",
    :ingredients=>"Flocons d'avoine (50g), Banane (1), Blancs d'œufs (2), Lait d'amande (50ml), Cannelle (1 pincée).",
    :tips=>"Ajoute un peu de beurre de cacahuète pour plus de protéines.",
    :instructions=>"1. Mixe tous les ingrédients ensemble.\n2. Verse la pâte dans un gaufrier chaud.\n3. Laisse cuire 3 à 5 minutes et sers avec des fruits.",
    :proteines=>14,
    :glucides=>28,
    :lipides=>6,
    :calories=>260
  },
  {
    :nom=>"Granola maison aux amandes et noisettes",
    :repas_de_la_journee=>"Petit-déjeuner",
    :temps_de_preparation=>40,
    :difficulte=>"Moyen",
    :ingredients=>"Flocons d'avoine (200g), Amandes (50g), Noisettes (50g), Miel (2 cuillères à soupe), Huile de coco (1 cuillère à soupe).",
    :tips=>"Ajoutez des pépites de chocolat noir après cuisson pour plus de gourmandise.",
    :instructions=>"1. Mélangez tous les ingrédients et étalez sur une plaque de cuisson.\n2. Faites cuire au four à 160°C pendant 30 minutes en remuant de temps en temps.\n3. Laissez refroidir avant de déguster.",
    :proteines=>18,
    :glucides=>52,
    :lipides=>30,
    :calories=>520
  },
  {
    :nom=>"Wrap au poulet, crudités et houmous",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>20,
    :difficulte=>"Facile",
    :ingredients=>"Galette de blé complet (1), Blanc de poulet (100g), Carottes râpées (50g), Concombre (50g), Houmous (2 cuillères à soupe).",
    :tips=>"Ajoute un filet de citron ou un peu de cumin dans le houmous pour plus de goût.",
    :instructions=>"1. Fais cuire et découpe le poulet en lamelles.\n2. Tartine le houmous sur la galette.\n3. Ajoute les crudités et le poulet.\n4. Roule le wrap et déguste frais ou toasté.",
    :proteines=>32,
    :glucides=>25,
    :lipides=>12,
    :calories=>370
  },
  {
    :nom=>"Tofu grillé aux légumes sautés",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>25,
    :difficulte=>"Facile",
    :ingredients=>"Tofu ferme (150g), Poivron (1), Courgette (1/2), Oignon (1/2), Sauce soja (1 cuillère à soupe), Huile d’olive (1 cuillère à café).",
    :tips=>"Ajoute un peu de gingembre frais pour une touche asiatique.",
    :instructions=>"1. Coupe le tofu et les légumes en morceaux.\n2. Fais revenir l'oignon, puis ajoute les autres légumes.\n3. Ajoute le tofu, la sauce soja, et fais dorer le tout.",
    :proteines=>22,
    :glucides=>15,
    :lipides=>14,
    :calories=>300
  },
  {
    :nom=>"Chia pudding à la mangue",
    :repas_de_la_journee=>"Petit-déjeuner",
    :temps_de_preparation=>10,
    :difficulte=>"Facile",
    :ingredients=>"Graines de chia (3 cuillères à soupe), Lait d’amande (150ml), Mangue (1/2), Sirop d’érable (1 cuillère à café).",
    :tips=>"Prépare-le la veille pour un petit-déjeuner express.",
    :instructions=>"1. Mélange les graines de chia avec le lait et le sirop.\n2. Laisse reposer 10 min en remuant régulièrement.\n3. Place au frais pendant la nuit.\n4. Ajoute la mangue coupée en morceaux au moment de servir.",
    :proteines=>6,
    :glucides=>18,
    :lipides=>10,
    :calories=>220
  },
  {
    :nom=>"Soupe de lentilles corail au lait de coco",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>30,
    :difficulte=>"Facile",
    :ingredients=>"Lentilles corail (100g), Carotte (1), Oignon (1/2), Lait de coco (100ml), Bouillon de légumes (250ml), Curry (1 cuillère à café).",
    :tips=>"Ajoute du citron vert pour un twist rafraîchissant.",
    :instructions=>"1. Fais revenir l’oignon et les carottes.\n2. Ajoute les lentilles, le bouillon, le curry.\n3. Laisse mijoter 20 min puis ajoute le lait de coco.\n4. Mixe pour une texture veloutée.",
    :proteines=>14,
    :glucides=>32,
    :lipides=>10,
    :calories=>340
  },
  {
    :nom=>"Salade de pois chiches, avocat et tomates",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>15,
    :difficulte=>"Facile",
    :ingredients=>"Pois chiches cuits (100g), Avocat (1/2), Tomates cerises (100g), Jus de citron (1 cuillère à soupe), Herbes fraîches (persil, coriandre).",
    :tips=>"Ajoute un peu de feta pour plus de protéines.",
    :instructions=>"1. Coupe les tomates et l’avocat.\n2. Mélange avec les pois chiches.\n3. Assaisonne avec le citron et les herbes.\n4. Sers frais.",
    :proteines=>12,
    :glucides=>28,
    :lipides=>14,
    :calories=>340
  },
  {
    :nom=>"Smoothie bowl aux fruits rouges et granola",
    :repas_de_la_journee=>"Petit-déjeuner",
    :temps_de_preparation=>10,
    :difficulte=>"Facile",
    :ingredients=>"Fruits rouges surgelés (100g), Banane (1), Lait végétal (100ml), Granola maison (30g).",
    :tips=>"Ajoute une cuillère de yaourt nature pour plus d’onctuosité.",
    :instructions=>"1. Mixe les fruits, la banane et le lait.\n2. Verse dans un bol.\n3. Ajoute le granola et des fruits frais en topping.",
    :proteines=>6,
    :glucides=>34,
    :lipides=>8,
    :calories=>280
  },
  {
    :nom=>"Buddha bowl au riz complet et œuf poché",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>25,
    :difficulte=>"Moyen",
    :ingredients=>"Riz complet (80g), Épinards frais (50g), Carottes râpées (50g), Avocat (1/2), Œuf (1), Graines (1 cuillère à soupe).",
    :tips=>"Ajoute une sauce au yaourt citronné pour lier le tout.",
    :instructions=>"1. Fais cuire le riz et poche l’œuf.\n2. Dispose tous les ingrédients dans un bol.\n3. Saupoudre de graines et sers.",
    :proteines=>14,
    :glucides=>35,
    :lipides=>15,
    :calories=>400
  },
  {
    :nom=>"Galette de flocons d’avoine aux légumes",
    :repas_de_la_journee=>"Dîner",
    :temps_de_preparation=>20,
    :difficulte=>"Facile",
    :ingredients=>"Flocons d’avoine (50g), Carotte râpée (1), Courgette râpée (1/2), Œuf (1), Épices (curcuma, poivre).",
    :tips=>"Fais-les cuire dans une poêle antiadhésive sans matière grasse.",
    :instructions=>"1. Mélange tous les ingrédients.\n2. Forme des galettes.\n3. Fais cuire à feu moyen 5 min de chaque côté.",
    :proteines=>10,
    :glucides=>22,
    :lipides=>8,
    :calories=>260
  },
  {
    :nom=>"Riz de chou-fleur sauté au thon",
    :repas_de_la_journee=>"Déjeuner",
    :temps_de_preparation=>15,
    :difficulte=>"Facile",
    :ingredients=>"Chou-fleur râpé (150g), Thon naturel (100g), Oignon (1/2), Sauce soja (1 cuillère à soupe), Huile d’olive (1 cuillère à café).",
    :tips=>"Ajoute un œuf brouillé pour une version façon riz cantonais.",
    :instructions=>"1. Fais revenir l’oignon, puis ajoute le chou-fleur.\n2. Ajoute le thon et la sauce soja.\n3. Sers chaud.",
    :proteines=>26,
    :glucides=>8,
    :lipides=>10,
    :calories=>270
  },
  {
    :nom=>"Bananabread healthy aux flocons d’avoine",
    :repas_de_la_journee=>"Petit-déjeuner",
    :temps_de_preparation=>40,
    :difficulte=>"Moyen",
    :ingredients=>"Bananes mûres (2), Flocons d’avoine (100g), Œufs (2), Levure (1/2 sachet), Cannelle (1 cuillère à café).",
    :tips=>"Ajoute quelques pépites de chocolat noir pour le plaisir !",
    :instructions=>"1. Écrase les bananes.\n2. Ajoute les œufs, la cannelle, les flocons et la levure.\n3. Verse dans un moule et enfourne 30 min à 180°C.",
    :proteines=>12,
    :glucides=>38,
    :lipides=>7,
    :calories=>310
  }
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
p2 = Post.new(contenu: "Je viens de tester la recette de chirashi au saumon et avocat, c'était délicieux ! Preuve à l'appuie", user: u2, total_likes: 0, image_url: "chirashi.jpg")
p2.save!
puts "OK"
#
print "> Post 3..."
p3 = Post.new(contenu: "Hello les Fitos ! Est-ce que quelqu'un aurait une idée de recette full prot' pour ce soir ?", user: u3, total_likes: 0)
p3.save!
puts "OK"
#
print "> Post 4..."
p4 = Post.new(contenu: "Je veux pas me la ramener, mais regardez la masterclass que je viens de faire en suivant la recette des Brownies", user: u4, total_likes: 0, image_url: "brownies.jpg")
p4.save!
puts "OK"
#
print "> Post 5..."
p5 = Post.new(contenu: "Combien de cheat meals vous vous autorisez par semaine ?", user: u3, total_likes: 0)
p5.save!
puts "OK"
#
print "> Post 6..."
p6 = Post.new(contenu: "Une recette vegan validée par la commu à faire en moins de 30 min svp ?", user: u4, total_likes: 0)
p6.save!
puts "OK"
#
#
print "> Post 7..."
p7 = Post.new(contenu: "Hey, des gens qui ont déjà testé la recette du Smoothie Bowl fruits rouges et granola ?", user: u5, total_likes: 0)
p7.save!
puts "OK"
#
#
print "> Post 8..."
p8 = Post.new(contenu: "Salut les Fitos, juste un ptit message pour vous dire que je suis tombée amoureuse du Tofu grillé aux légumes (je l'ai fait avec du riz plutôt que des nouilles). La bise !", user: u6, total_likes: 0, image_url: "tofu.jpg")
p8.save!
puts "OK"
#
#
print "> Post 9..."
p9 = Post.new(contenu: "Yo la team, est-ce que des Fitos seraient partant.es pour un brunch ce dimanche (banana bred, granola, pancakes...) ? C'est moi qui invite !", user: u7, total_likes: 0)
p9.save!
puts "OK"
#
#
print "> Post 10..."
p10 = Post.new(contenu: "Quiche Lorraine validée à 100% !", user: u8, total_likes: 0, image_url: "quiche.jpg")
p10.save!
puts "OK"
#
#
print "> Post 11..."
p11 = Post.new(contenu: "Hello tout le monde ! Je cherche une idée de dessert pour ce soir, des idées ?", user: u1, total_likes: 0)
p11.save!
puts "OK"
#
#
print "> Post 12..."
p12 = Post.new(contenu: "Salade de pois chiches hyper simple et très bonne J'ai rajouté des concombres, c'est top !", user: u7, total_likes: 0, image_url: "salade.jpg")
p12.save!
puts "OK"
#


puts " ===== "
# ===== Likes generation
count = 0
[u1, u2, u3, u4, u5, u6, u7].each_with_index do |user, u_index|
  [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12].each_with_index do |post, p_index|
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
c3 = Commentaire.new(post: p2, user: u4, content: "J'avais envie de tester cette recette depuis longtemps. C'est décidé, ce midi je me lance 😤")
c3.save!
puts "OK"
#
print "> Commentaire 4..."
c4 = Commentaire.new(post: p4, user: u2, content: "Ça a l'air delicieux (même si tu te la racontes un peu quand même haha) !")
c4.save!
puts "OK"
#
print "> Commentaire 5..."
c5 = Commentaire.new(post: p5, user: u4, content: "Ça varie pas mal d'une semaine à l'autre, mais j'essaye de me limiter à 3 😅")
c5.save!
puts "OK"
#
print "> Commentaire 6..."
c6 = Commentaire.new(post: p7, user: u2, content: "Yes déjà testé, c'est une tuerie 🤯")
c6.save!
puts "OK"
#
print "> Commentaire 7..."
c7 = Commentaire.new(post: p8, user: u3, content: "J'avoue qu'avec du riz ça doit être succulent. Bien ouej cuisto 👩‍🍳")
c7.save!
puts "OK"
#
print "> Commentaire 8..."
c8 = Commentaire.new(post: p9, user: u4, content: "Trop bonne idée, je suis partant !")
c8.save!
puts "OK"
#
print "> Commentaire 9..."
c9 = Commentaire.new(post: p9, user: u6, content: "Grave, chaud !")
c9.save!
puts "OK"
#
print "> Commentaire 10..."
c10 = Commentaire.new(post: p10, user: u2, content: "Mamaaaaa ça a l'air fameux !")
c10.save!
puts "OK"
#
print "> Commentaire 11..."
c11 = Commentaire.new(post: p12, user: u4, content: "Oh bien vu le twist avec les concombres, je vais tester ça. Merci 😉")
c11.save!
puts "OK"
#
print "> Commentaire 12..."
c12 = Commentaire.new(post: p11, user: u8, content: "J'ai testé le Tiramisu l'autre jour, je ne m'en remets toujours pas. Fonce dessus !")
c12.save!
puts "OK"
#
print "> Commentaire 13..."
c13 = Commentaire.new(post: p8, user: u5, content: "Allez hop, j'ai trouvé mon repas du soir !")
c13.save!
puts "OK"
#
print "> Commentaire 14..."
c14 = Commentaire.new(post: p10, user: u7, content: "Ça a l'air trop bon 🤤")
c14.save!
puts "OK"


# TODO : si on ajoute un jour la table ingredients
# il faudra decommenter le code suivant
# puts " ===== "
# # ===== Ingredients generation
# ingredients = [
#   {:nom=>:Spaghetti, :quantite=>"100g", :calories=>158, :proteines=>5.8, :glucides=>31.9, :lipides=>0.9},
#   {:nom=>:Œufs, :quantite=>"unite", :calories=>68, :proteines=>5.5, :glucides=>0.6, :lipides=>4.8},
#   {:nom=>:Lardons, :quantite=>"100g", :calories=>295, :proteines=>18, :glucides=>1, :lipides=>26},
#   {:nom=>:Parmesan, :quantite=>"100g", :calories=>431, :proteines=>38, :glucides=>4, :lipides=>29},
#   {:nom=>:Poivre, :quantite=>"100g", :calories=>6, :proteines=>0.3, :glucides=>1.5, :lipides=>0.1},
#   {:nom=>:Sel, :quantite=>"100g", :calories=>0, :proteines=>0, :glucides=>0, :lipides=>0},
#   {:nom=>:"Pâtes à lasagne", :quantite=>"100g", :calories=>70, :proteines=>2.5, :glucides=>14, :lipides=>0.5},
#   {:nom=>:"Viande hachée", :quantite=>"100g", :calories=>250, :proteines=>26, :glucides=>0, :lipides=>17},
#   {:nom=>:"Tomates concassées", :quantite=>"100g", :calories=>32, :proteines=>1.5, :glucides=>7, :lipides=>0.3},
#   {:nom=>:Oignon, :quantite=>"unite", :calories=>44, :proteines=>1, :glucides=>10, :lipides=>0.1},
#   {:nom=>:Béchamel, :quantite=>"100g", :calories=>120, :proteines=>3, :glucides=>10, :lipides=>8},
#   {:nom=>:"Fromage râpé", :quantite=>"100g", :calories=>280, :proteines=>25, :glucides=>3, :lipides=>20},
#   {:nom=>:Bœuf, :quantite=>"100g", :calories=>250, :proteines=>26, :glucides=>0, :lipides=>17},
#   {:nom=>:"Vin rouge", :quantite=>"100g", :calories=>85, :proteines=>0.1, :glucides=>2.6, :lipides=>0},
#   {:nom=>:Carottes, :quantite=>"unite", :calories=>25, :proteines=>0.6, :glucides=>6, :lipides=>0.1},
#   {:nom=>:Champignons, :quantite=>"100g", :calories=>22, :proteines=>3, :glucides=>3.3, :lipides=>0.3},
#   {:nom=>:Farine, :quantite=>"100g", :calories=>364, :proteines=>10, :glucides=>76, :lipides=>1},
#   {:nom=>:Lait, :quantite=>"100g", :calories=>61, :proteines=>3.2, :glucides=>4.8, :lipides=>3.3},
#   {:nom=>:Sucre, :quantite=>"100g", :calories=>400, :proteines=>0, :glucides=>100, :lipides=>0},
#   {:nom=>:Beurre, :quantite=>"100g", :calories=>717, :proteines=>0.9, :glucides=>0.1, :lipides=>81},
#   {:nom=>:"Levure chimique", :quantite=>"100g", :calories=>6, :proteines=>0, :glucides=>1.6, :lipides=>0},
#   {:nom=>:Mascarpone, :quantite=>"100g", :calories=>429, :proteines=>4.6, :glucides=>3.9, :lipides=>44},
#   {:nom=>:Café, :quantite=>"100g", :calories=>2, :proteines=>0.3, :glucides=>0.4, :lipides=>0},
#   {:nom=>:"Biscuits cuillère", :quantite=>"100g", :calories=>380, :proteines=>7.6, :glucides=>78, :lipides=>3},
#   {:nom=>:Cacao, :quantite=>"100g", :calories=>228, :proteines=>20, :glucides=>58, :lipides=>14},
#   {:nom=>:"Pâte brisée", :quantite=>"100g", :calories=>220, :proteines=>2.3, :glucides=>24, :lipides=>12},
#   {:nom=>:"Crème fraîche", :quantite=>"100g", :calories=>340, :proteines=>2.1, :glucides=>3.0, :lipides=>35},
#   {:nom=>:"Gruyère râpé", :quantite=>"100g", :calories=>413, :proteines=>29, :glucides=>0.4, :lipides=>33},
#   {:nom=>:"Blancs de poulet", :quantite=>"100g", :calories=>165, :proteines=>31, :glucides=>0, :lipides=>3.6},
#   {:nom=>:"Lait de coco", :quantite=>"100g", :calories=>230, :proteines=>2, :glucides=>6, :lipides=>24},
#   {:nom=>:Pommes, :quantite=>"unite", :calories=>52, :proteines=>0.3, :glucides=>14, :lipides=>0.2},
#   {:nom=>:Poire, :quantite=>"unite", :calories=>57, :proteines=>0.4, :glucides=>15, :lipides=>0.1},
#   {:nom=>:Pêche, :quantite=>"unite", :calories=>39, :proteines=>0.9, :glucides=>9.6, :lipides=>0.2},
#   {:nom=>:Mango, :quantite=>"unite", :calories=>60, :proteines=>0.8, :glucides=>15, :lipides=>0.4},
#   {:nom=>:Ananas, :quantite=>"unite", :calories=>50, :proteines=>0.5, :glucides=>13, :lipides=>0.1},
#   {:nom=>:Kiwi, :quantite=>"unite", :calories=>41, :proteines=>0.8, :glucides=>9.1, :lipides=>0.4},
#   {:nom=>:Fraisiers, :quantite=>"100g", :calories=>32, :proteines=>0.8, :glucides=>7.7, :lipides=>0.3},
#   {:nom=>:Bleuets, :quantite=>"100g", :calories=>57, :proteines=>0.7, :glucides=>14, :lipides=>0.3},
#   {:nom=>:"Chocolat au lait", :quantite=>"100g", :calories=>535, :proteines=>7.6, :glucides=>61, :lipides=>30},
#   {:nom=>:"Chocolat noir", :quantite=>"100g", :calories=>546, :proteines=>4.3, :glucides=>61, :lipides=>31},
#   {:nom=>:Amandes, :quantite=>"100g", :calories=>579, :proteines=>21.2, :glucides=>21.6, :lipides=>49.9},
#   {:nom=>:"Noix de pécan", :quantite=>"100g", :calories=>691, :proteines=>9.2, :glucides=>13.9, :lipides=>72},
#   {:nom=>:"Noix de cajou", :quantite=>"100g", :calories=>553, :proteines=>18.2, :glucides=>30.2, :lipides=>43.9},
#   {:nom=>:Pistaches, :quantite=>"100g", :calories=>562, :proteines=>20.2, :glucides=>28, :lipides=>45.4},
#   {:nom=>:Myrtilles, :quantite=>"100g", :calories=>57, :proteines=>0.7, :glucides=>14, :lipides=>0.3},
#   {:nom=>:"Lait écrémé", :quantite=>"100g", :calories=>35, :proteines=>3.4, :glucides=>5, :lipides=>0.1},
#   {:nom=>:"Lait de soja", :quantite=>"100g", :calories=>33, :proteines=>3.3, :glucides=>1.3, :lipides=>1.9},
#   {:nom=>:Tomates, :quantite=>"unite", :calories=>18, :proteines=>0.9, :glucides=>3.9, :lipides=>0.2},
#   {:nom=>:Courgettes, :quantite=>"unite", :calories=>17, :proteines=>1.2, :glucides=>3.1, :lipides=>0.3},
#   {:nom=>:Poivrons, :quantite=>"unite", :calories=>20, :proteines=>0.9, :glucides=>4.6, :lipides=>0.2},
#   {:nom=>:Aubergine, :quantite=>"unite", :calories=>25, :proteines=>1, :glucides=>6, :lipides=>0.2},
#   {:nom=>:Brocolis, :quantite=>"100g", :calories=>34, :proteines=>2.8, :glucides=>6.6, :lipides=>0.4},
#   {:nom=>:Céleri, :quantite=>"100g", :calories=>14, :proteines=>0.7, :glucides=>3, :lipides=>0.2},
#   {:nom=>:"Haricots verts", :quantite=>"100g", :calories=>31, :proteines=>1.8, :glucides=>7, :lipides=>0.1},
#   {:nom=>:"Chou-fleur", :quantite=>"100g", :calories=>25, :proteines=>1.9, :glucides=>4.9, :lipides=>0.3},
#   {:nom=>:Laitue, :quantite=>"100g", :calories=>15, :proteines=>1.4, :glucides=>2.9, :lipides=>0.2},
#   {:nom=>:Épinards, :quantite=>"100g", :calories=>23, :proteines=>2.9, :glucides=>3.6, :lipides=>0.4},
#   {:nom=>:Radis, :quantite=>"100g", :calories=>16, :proteines=>0.8, :glucides=>3.4, :lipides=>0.1},
#   {:nom=>:Cresson, :quantite=>"100g", :calories=>11, :proteines=>2.3, :glucides=>1.3, :lipides=>0.2},
#   {:nom=>:Avocat, :quantite=>"unite", :calories=>160, :proteines=>2, :glucides=>9, :lipides=>15},
#   {:nom=>:Mûres, :quantite=>"100g", :calories=>43, :proteines=>1.4, :glucides=>9.6, :lipides=>0.5},
#   {:nom=>:Framboises, :quantite=>"100g", :calories=>52, :proteines=>1.5, :glucides=>12, :lipides=>0.7},
#   {:nom=>:Cassis, :quantite=>"100g", :calories=>63, :proteines=>1.4, :glucides=>15, :lipides=>0.4},
#   {:nom=>:"Pommes de terre", :quantite=>"unite", :calories=>77, :proteines=>2, :glucides=>17, :lipides=>0.1},
#   {:nom=>:"Patate douce", :quantite=>"100g", :calories=>86, :proteines=>1.6, :glucides=>20, :lipides=>0.1},
#   {:nom=>:Panais, :quantite=>"100g", :calories=>75, :proteines=>1.5, :glucides=>18, :lipides=>0.3},
#   {:nom=>:"Pois chiches", :quantite=>"100g", :calories=>164, :proteines=>8.9, :glucides=>27.4, :lipides=>2.6},
#   {:nom=>:Lentilles, :quantite=>"100g", :calories=>116, :proteines=>9, :glucides=>20, :lipides=>0.4},
#   {:nom=>:"Pois verts", :quantite=>"100g", :calories=>81, :proteines=>5.4, :glucides=>14.5, :lipides=>0.4},
#   {:nom=>:Quinoa, :quantite=>"100g", :calories=>368, :proteines=>14, :glucides=>64, :lipides=>6.1},
#   {:nom=>:"Riz basmati", :quantite=>"100g", :calories=>120, :proteines=>2.4, :glucides=>25.2, :lipides=>0.4},
#   {:nom=>:"Riz complet", :quantite=>"100g", :calories=>111, :proteines=>2.6, :glucides=>23, :lipides=>0.9},
#   {:nom=>:Sarrasin, :quantite=>"100g", :calories=>343, :proteines=>13.3, :glucides=>71.5, :lipides=>3.4},
#   {:nom=>:Avoine, :quantite=>"100g", :calories=>389, :proteines=>16.9, :glucides=>66.3, :lipides=>6.9},
#   {:nom=>:Miel, :quantite=>"100g", :calories=>304, :proteines=>0.3, :glucides=>82.4, :lipides=>0},
#   {:nom=>:"Coco râpé", :quantite=>"100g", :calories=>660, :proteines=>6.9, :glucides=>23.6, :lipides=>64.5},
#   {:nom=>:"Beurre de cacahuètes", :quantite=>"100g", :calories=>588, :proteines=>25.1, :glucides=>20.6, :lipides=>50.4},
#   {:nom=>:"Tomates cerises", :quantite=>"100g", :calories=>18, :proteines=>0.9, :glucides=>3.9, :lipides=>0.2},
#   {:nom=>:"Oignons rouges", :quantite=>"100g", :calories=>40, :proteines=>1.1, :glucides=>9.3, :lipides=>0.1},
#   {:nom=>:"Lait de vache entier", :quantite=>"100g", :calories=>61, :proteines=>3.3, :glucides=>4.8, :lipides=>3.3},
#   {:nom=>:"Lait d’amande", :quantite=>"100g", :calories=>17, :proteines=>0.6, :glucides=>0.7, :lipides=>1.1},
#   {:nom=>:Moules, :quantite=>"100g", :calories=>172, :proteines=>24.5, :glucides=>7, :lipides=>4.5},
#   {:nom=>:"Saumon frais", :quantite=>"100g", :calories=>208, :proteines=>20.5, :glucides=>0, :lipides=>13},
#   {:nom=>:Crevettes, :quantite=>"100g", :calories=>99, :proteines=>24, :glucides=>0.2, :lipides=>0.3},
#   {:nom=>:"Filet de morue", :quantite=>"100g", :calories=>105, :proteines=>23, :glucides=>0, :lipides=>0.9},
#   {:nom=>:"Poisson blanc", :quantite=>"100g", :calories=>80, :proteines=>18, :glucides=>0, :lipides=>1},
#   {:nom=>:Daurade, :quantite=>"100g", :calories=>91, :proteines=>20, :glucides=>0, :lipides=>1.5},
#   {:nom=>:"Thon en boîte", :quantite=>"100g", :calories=>132, :proteines=>28, :glucides=>0, :lipides=>1.5},
#   {:nom=>:"Pain complet", :quantite=>"100g", :calories=>246, :proteines=>9, :glucides=>41, :lipides=>3.5},
#   {:nom=>:"Pain de mie", :quantite=>"100g", :calories=>265, :proteines=>9, :glucides=>47, :lipides=>4},
#   {:nom=>:"Pain de campagne", :quantite=>"100g", :calories=>270, :proteines=>9, :glucides=>50, :lipides=>4},
#   {:nom=>:"Pain de seigle", :quantite=>"100g", :calories=>259, :proteines=>9, :glucides=>49, :lipides=>3},
#   {:nom=>:"Pain pita", :quantite=>"100g", :calories=>275, :proteines=>8, :glucides=>52, :lipides=>3},
#   {:nom=>:Couscous, :quantite=>"100g", :calories=>376, :proteines=>13, :glucides=>75, :lipides=>1},
#   {:nom=>:Semoule, :quantite=>"100g", :calories=>360, :proteines=>12, :glucides=>72, :lipides=>1.5},
#   {:nom=>:"Sushi au saumon", :quantite=>"100g", :calories=>130, :proteines=>15, :glucides=>26, :lipides=>5},
#   {:nom=>:Penne, :quantite=>"100g", :calories=>131, :proteines=>5, :glucides=>25, :lipides=>1.1},
#   {:nom=>:Fusilli, :quantite=>"100g", :calories=>133, :proteines=>5, :glucides=>27, :lipides=>1.5},
#   {:nom=>:"Spaghettis de blé complet", :quantite=>"100g", :calories=>140, :proteines=>5, :glucides=>30, :lipides=>1.2},
#   {:nom=>:Fettuccine, :quantite=>"100g", :calories=>157, :proteines=>5.3, :glucides=>30, :lipides=>1.4},
#   {:nom=>:"Raviolis frais", :quantite=>"100g", :calories=>200, :proteines=>5, :glucides=>42, :lipides=>2},
#   {:nom=>:"Tortillas de maïs", :quantite=>"100g", :calories=>218, :proteines=>5, :glucides=>44, :lipides=>3.5},
#   {:nom=>:"Tortillas de blé", :quantite=>"100g", :calories=>300, :proteines=>7, :glucides=>58, :lipides=>5},
#   {:nom=>:"Maïs en grains", :quantite=>"100g", :calories=>96, :proteines=>3.4, :glucides=>19, :lipides=>1.5},
#   {:nom=>:"Maïs doux", :quantite=>"100g", :calories=>96, :proteines=>3.4, :glucides=>19, :lipides=>1.5},
#   {:nom=>:"Pois verts surgelés", :quantite=>"100g", :calories=>81, :proteines=>5.4, :glucides=>14.5, :lipides=>0.4},
#   {:nom=>:"Carottes râpées", :quantite=>"100g", :calories=>41, :proteines=>0.9, :glucides=>9.6, :lipides=>0.2},
#   {:nom=>:"Chou kale", :quantite=>"100g", :calories=>49, :proteines=>4.3, :glucides=>8.8, :lipides=>0.9},
#   {:nom=>:"Chou chinois", :quantite=>"100g", :calories=>13, :proteines=>1.2, :glucides=>2.6, :lipides=>0.2}
# ]

puts " ===== "
# ===== Reviews generation
print "> Review 1..."
r1 = Review.new(user: u1, recette: recette1, note: 5, commentaire: "Recette très simple à réaliser et délicieuse !")
r1.save!
recette1.calculate_average_rating
puts "OK"
#
print "> Review 2..."
r2 = Review.new(user: u2, recette: recette1, note: 4, commentaire: "J'ai adoré, mais j'ai trouvé que c'était un peu trop salé.")
r2.save!
recette1.calculate_average_rating
puts "OK"
#
print "> Review 3..."
r3 = Review.new(user: u3, recette: recette1, note: 5, commentaire: "Recette parfaite, je la referai sans hésiter !")
r3.save!
recette1.calculate_average_rating
puts "OK"

tiramisu = Recette.find_by(nom: "Tiramisu")
Review.create!(user: u3, recette: tiramisu, note: 5, commentaire: "Un classique toujours aussi bon, j’ai adoré cette version maison !")
Review.create!(user: u6, recette: tiramisu, note: 4, commentaire: "Très bon ! Un peu sucré à mon goût, mais la texture est top.")
Review.create!(user: u7, recette: tiramisu, note: 5, commentaire: "C’est devenu mon dessert du week-end. Merci !")
tiramisu.calculate_average_rating

brownie = Recette.find_by(nom: "Brownie au chocolat protéiné")
Review.create!(user: u1, recette: brownie, note: 5, commentaire: "Masterclass 🔥 Fondant à souhait et pas trop sucré.")
Review.create!(user: u2, recette: brownie, note: 4, commentaire: "Très bon pour un brownie protéiné. Je m’attendais à moins de gourmandise.")
Review.create!(user: u5, recette: brownie, note: 4, commentaire: "Surpris par le goût ! Même les enfants ont aimé.")
brownie.calculate_average_rating

carbonara = Recette.find_by(nom: "Spaghetti Carbonara")
Review.create!(user: u3, recette: carbonara, note: 5, commentaire: "Un classique maîtrisé, ça fait plaisir 🍝")
Review.create!(user: u6, recette: carbonara, note: 4, commentaire: "Bien bon, j’ai ajouté un peu de crème quand même 😅")
Review.create!(user: u7, recette: carbonara, note: 4, commentaire: "Très bon, même réchauffé le lendemain !")
carbonara.calculate_average_rating

pancakes = Recette.find_by(nom: "Pancakes")
Review.create!(user: u1, recette: pancakes, note: 5, commentaire: "Ultra moelleux, j’ai ajouté du sirop d’érable, c’était une dinguerie.")
Review.create!(user: u8, recette: pancakes, note: 4, commentaire: "Validé par toute la famille au ptit déj 🥞")
Review.create!(user: u4, recette: pancakes, note: 4, commentaire: "Rapide à faire et ça cale bien.")
pancakes.calculate_average_rating

quiche = Recette.find_by(nom: "Quiche Lorraine")
Review.create!(user: u5, recette: quiche, note: 5, commentaire: "Recette validée 100%. La pâte était bien croustillante.")
Review.create!(user: u3, recette: quiche, note: 4, commentaire: "Très bon, j’ai mis un peu de muscade en plus.")
Review.create!(user: u2, recette: quiche, note: 3, commentaire: "Simple, efficace. J’aurais préféré plus de fromage.")
quiche.calculate_average_rating

tofu = Recette.find_by(nom: "Tofu grillé aux légumes sautés")
Review.create!(user: u6, recette: tofu, note: 4, commentaire: "Bien assaisonné, j’ai adoré avec un peu de riz à côté.")
Review.create!(user: u1, recette: tofu, note: 3, commentaire: "Bon mais faut aimer le tofu nature. Avec sauce soja c’est top.")
Review.create!(user: u7, recette: tofu, note: 4, commentaire: "J’ai testé avec gingembre frais, super bon !")
tofu.calculate_average_rating
wrap = Recette.find_by(nom: "Wrap au poulet, crudités et houmous")
Review.create!(user: u2, recette: wrap, note: 5, commentaire: "Super frais et rapide, j’en fais souvent le midi ! 🥙")
Review.create!(user: u6, recette: wrap, note: 4, commentaire: "J’ai remplacé le houmous par du tzatziki, c'était nickel aussi.")
Review.create!(user: u4, recette: wrap, note: 4, commentaire: "Simple mais efficace. Bien pour emporter.")

wrap.calculate_average_rating

bananabread = Recette.find_by(nom: "Bananabread healthy aux flocons d’avoine")
Review.create!(user: u5, recette: bananabread, note: 5, commentaire: "Parfait avec mon café du matin ☕️ J’ai mis des pépites de chocolat.")
Review.create!(user: u3, recette: bananabread, note: 4, commentaire: "Moelleux et sain, j’en refais la semaine prochaine.")
Review.create!(user: u1, recette: bananabread, note: 3, commentaire: "Un peu moins sucré que ce que j'aime, mais validé pour un petit-déj fit.")
bananabread.calculate_average_rating

puts "Reviews pour Tiramisu, Brownie et 4 autres recettes ajoutées !"

puts " ===== "

# ===== End of generation
puts "#{User.count} Users generated successfully"
puts "#{Recette.count} Recettes generated successfully"
puts "#{Post.count} Posts generated successfully"
puts "#{Like.count} Likes generated successfully"
puts "#{Commentaire.count} Commentaires generated successfully"
puts "#{Review.count} Reviews generated successfully"
