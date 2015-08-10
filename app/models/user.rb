class User < ActiveRecord::Base
	validates :name, presence: true
	# validates :name, presence: { strict: true }
	# what's the difference?

	validates :email, format: { allow_blank: true, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
	validates :email, uniqueness: true, presence: true

	validates :location, presence: true
	# ERROR: how can I make it ignore spaces? (with /x ?)
	validates :location, format: { allow_blank: true, with: /\A[a-zA-Z]+\z/i }

  # ERROR: -._123 should also be accepted!!!
	validates :twitter_handle, format: { allow_blank: true, with: /\A\w+\z/i, message: "%{value} is not a valid twitter handle!"}
	# when present, check for uniqueness
	validates :twitter_handle, uniqueness: true, if: 'twitter_handle.present?'

	validates :female, :inclusion => {:in => [true, false]}

	validates :beginner, :inclusion => {:in => [true, false]}
end
