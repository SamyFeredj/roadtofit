class AddNoteColumnToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :note, :integer
  end
end
