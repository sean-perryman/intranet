class User < ActiveRecord::Base
	attr_accessor :password
	
	#relationships
	has_many :expenses

	#validations
	validates :email, presence: true,
										uniqueness: true,
										if: :email

	validates_presence_of :password, if: :password, :on => :create
	validates_confirmation_of :password

	#before actions
	before_save :encrypt_password, :unless => Proc.new { |u| u.password.blank? }
	before_save { self.email = email.downcase }

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

  def self.authenticate(email, password)
  	#need to change this over to username - Maybe either/or?
	  user = User.where(:email => email).first
	  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	  	user
	  else
	  	nil
	  end
  end

end