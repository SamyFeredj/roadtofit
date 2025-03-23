class DeleteColumnFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :note
  end
end
