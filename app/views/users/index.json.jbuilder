json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :location, :twitter_handle, :female, :student_coach, :beginner
  json.url user_url(user, format: :json)
end
