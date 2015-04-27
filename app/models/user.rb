class User < ActiveRecord::Base
	validates :location, presence: true
	validates :twitter_handle, format: { with: /\A\w+\z/, message: "%{value} is not a valid twitter handle!"}
end
