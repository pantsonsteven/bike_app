class User < ActiveRecord::Base
  
  has_secure_password
  validates :email, presence: true, confirmation: true, uniqueness: true, email: true
  validates :password, length: {within: 8..14, too_short: "Your password is too short", too_long: "Your password is too long"}
  has_many :trips

end
