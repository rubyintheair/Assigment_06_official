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

  def self.generate_posts(n, user = nil)
    user ||= User.last
    n.times do 
      post = Post.create(
        body: Faker::HowIMetYourMother.quote,
        wall_user_id: user.id,
        poster: User.random_user
      )
      
      rand(3).times do 
        post.comments.create(
          body: Faker::HowIMetYourMother.catch_phrase,
          user_id: User.random_user.id
        )
      end 
    end 
  end

end
