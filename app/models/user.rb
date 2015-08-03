class User < ActiveRecord::Base
	validates :location, presence: true
	validates :twitter_handle, format: { allow_blank: true, with: /\A\w+\z/, message: "%{value} is not a valid twitter handle!"}
	validates :twitter_handle, uniqueness: true, presence: true
	validates :name, presence: true
  validates :email, format: { allow_blank: true, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create}
	validates :email, uniqueness: true, presence: true
end
