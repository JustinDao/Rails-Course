class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :name, :email
	validates_uniqueness_of :email
	validates :password, length: {minimum: 6}

	has_many :reviews
end
