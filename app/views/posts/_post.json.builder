json.extract! @post, :id, :body, :wall_user_id, :photo, :created_at, :updated_at
json.poster @post.poster, :id, :name, :email, :gender, :avatar