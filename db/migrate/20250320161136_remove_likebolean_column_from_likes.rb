class RemoveLikeboleanColumnFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :likeboolean, :boolean
  end
end
