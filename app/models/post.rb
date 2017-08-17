class Post < ApplicationRecord
  belongs_to :poster, class_name: "User"
  has_many :likes, as: :item
  validates :body, presence: true
end
