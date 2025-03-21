class CreateChoixRecettes < ActiveRecord::Migration[7.1]
  def change
    create_table :choix_recettes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recette, null: false, foreign_key: true
      t.date :date
      t.boolean :done

      t.timestamps
    end
  end
end
