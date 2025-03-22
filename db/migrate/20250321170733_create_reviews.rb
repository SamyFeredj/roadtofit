class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :recette, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :note
      t.string :commentaire

      t.timestamps
    end
  end
end
