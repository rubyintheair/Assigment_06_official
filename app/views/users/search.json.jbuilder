json.array! @users do |user|
  json.name user.name
  json.id user.id
  json.email user.email
  json.link profile_user_path(user.id)
end 