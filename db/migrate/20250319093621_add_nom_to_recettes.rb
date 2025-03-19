class AddNomToRecettes < ActiveRecord::Migration[7.1]
  def change
    add_column :recettes, :nom, :string
  end
end
