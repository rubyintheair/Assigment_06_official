class RemoveWallFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :wall_user, :string
  end
end
