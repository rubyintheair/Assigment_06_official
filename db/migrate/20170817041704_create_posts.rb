class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :poster_id
      t.string :body
      t.integer :wall_user_id

      t.timestamps
    end
  end
end
