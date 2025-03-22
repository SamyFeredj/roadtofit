class ChangeColumnNoteOfRecette < ActiveRecord::Migration[7.1]
  def change
    change_column :recettes, :note_globale, :float
  end
end
