class AddLikeColumnToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :like_flag, :integer
  end
end
