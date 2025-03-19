class RemoveTempsDePreparationFromRecettes < ActiveRecord::Migration[7.1]
  def change
    remove_column :recettes, :temps_de_preparation, :time
  end
end
