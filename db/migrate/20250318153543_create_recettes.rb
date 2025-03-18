class CreateRecettes < ActiveRecord::Migration[7.1]
  def change
    create_table :recettes do |t|
      t.integer :lipides
      t.integer :glucides
      t.integer :proteines
      t.integer :calories
      t.string :ingredients
      t.string :repas_de_la_journee
      t.string :tips
      t.text :instructions
      t.string :difficulte
      t.time :temps_de_preparation
      t.string :tags

      t.timestamps
    end
  end
end
