json.array!(@users) do |user|
  json.extract! user, :id, :image
  json.url user_url(user, format: :json)
end
