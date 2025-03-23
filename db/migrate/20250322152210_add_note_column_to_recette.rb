class AddNoteColumnToRecette < ActiveRecord::Migration[7.1]
  def change
    add_column :recettes, :note_globale, :integer
  end
end
