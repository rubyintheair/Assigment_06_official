class Post < ApplicationRecord
  belongs_to :poster, class_name: "User"
  has_many :likes, as: :item
  validates :body, presence: true
  has_many :comments, dependent: :destroy
  mount_uploader :photo, AvatarUploader

  def photo_url
    photo.url 
  end

  def user_name
    user.name_or_mail
  end 
end
