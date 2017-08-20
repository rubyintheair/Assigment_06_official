class AddPhotoToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :photo, :string
  end
end
