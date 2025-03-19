class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.string :contenu
      t.integer :total_likes

      t.timestamps
    end
  end
end
