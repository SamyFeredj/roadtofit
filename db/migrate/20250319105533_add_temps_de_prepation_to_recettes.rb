class AddTempsDePrepationToRecettes < ActiveRecord::Migration[7.1]
  def change
    add_column :recettes, :temps_de_preparation, :integer
  end
end
