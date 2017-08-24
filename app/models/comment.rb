class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :item
  mount_uploader :photo, AvatarUploader
end
