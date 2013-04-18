# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  has_secure_password

 before_save { |user| user.email = email.downcase }
 before_save :create_remember_token

  validates :name, presence: true
  validates :email, 
	  presence: true,
	  length: { in: 5..20 },
	  format: { with: VALID_EMAIL_REGEX },
  	  uniqueness: { case_sensitive: false}
  validates :password,
	 presence: true,
	confirmation: true,
	length: { minimum: 5 }
  validates :password_confirmation,
	 presence: true 

  private
    def create_remember_token
	    self.remember_token = SecureRandom.urlsafe_base64
    end
end
