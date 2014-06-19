class User < ActiveRecord::Base
 
  has_many :trips
  has_secure_password
  
  validates :email, presence: true, confirmation: true, uniqueness: true , email: true
  
  validates :password, length: {within: 8..14, too_short: "is too short, it needs to be between 8 and 14 characters", too_long: "is too long, it needs to be between 8 and 14 characters"}  

end
 


