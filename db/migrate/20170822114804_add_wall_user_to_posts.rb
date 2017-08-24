class AddWallUserToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :wall_user, :string
  end
end
