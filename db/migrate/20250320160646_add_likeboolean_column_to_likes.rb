class AddLikebooleanColumnToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :likeboolean, :boolean
  end
end
