class RemoveLikeColumnFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :like, :integer
  end
end
