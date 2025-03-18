class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :prenom, :string
    add_column :users, :nom, :string
    add_column :users, :pseudo, :string
    add_column :users, :poids, :float
    add_column :users, :taille, :integer
    add_column :users, :age, :integer
    add_column :users, :sexe, :string
    add_column :users, :objectif_physique, :string
    add_column :users, :objectif_calorique, :integer
    add_column :users, :regimes_alimentaires, :string
  end
end
