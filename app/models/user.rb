class User < ActiveRecord::Base
	has_secure_password
 	has_many :contacts, dependent: :destroy
 	validates :email, uniqueness: true
	# attr_accessor :password_confirmation, :password
	# validates :password, :confirmation => true

	# before_save :digest_password

	# def authenticate(password)
	# 	# BCRYPT DOES STUFF
	# end

	# def digest_password
	# 	self.password_digest = BCRYPT.digest(password)
	# end


end
