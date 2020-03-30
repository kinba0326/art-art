json.array! @arts do |art|
  json.id art.id
  json.text art.text
  json.image art.image
  json.user_id art.user_id
  json.nickname art.user.nickname
  json.user_sign_in current_user
end