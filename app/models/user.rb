class User < ActiveRecord::Base
	validates :location, presence: true
	validates :twitter_handle, format: { allow_blank: true, with: /\A\w+\z/, message: "%{value} is not a valid twitter handle!"}
	validates :name, presence: true
  validates :email, format: { allow_blank: true, with: /\A[^@]+@[^@]+\.[^@]+\z/}
	validates :email, uniqueness: true, presence: true
end
