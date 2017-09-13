class User < ApplicationRecord

	has_secure_password

	validates_presence_of :first_name, :last_name, :email, :password_digest

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	validates :first_name, length: {minimum:3}

	validates :email, uniqueness: true

	def full_name
		first_name + " " + last_name
	end
end