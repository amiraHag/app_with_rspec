class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :password_confirmation, :telephone
  has_many :cars
  has_many :complains
  has_secure_password
  before_save :create_remember_token
  User.all.each{|user| user.save(validate:false)}
  before_save { |user| user.email = email.downcase }
  
validates(:name, presence: true , length: { :maximum => 30 })
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates(:email, presence: true , length: { :maximum => 35 } , format: { :with => VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false })
validates(:address, presence: true , length: { :maximum => 50 })
validates(:telephone, presence: true ,uniqueness: true )
validates :password, presence: true, length: { minimum: 8 }
 validates :password_confirmation, presence: true
 

    def create_remember_token
      self.remember_token = SecureRandom.hex
    end
end