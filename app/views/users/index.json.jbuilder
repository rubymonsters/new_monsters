json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :location, :twitter_handle, :female, :beginner, :already_notified
  json.url user_url(user, format: :json)
end
