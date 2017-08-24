class RemoveWallIdFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :wall_id, :string
  end
end
