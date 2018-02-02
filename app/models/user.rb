class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :recipes
    has_many :notifications, foreign_key: :recipient_id
    
    before_save {self.email = email.downcase}




    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    validates :username, uniqueness: true
    validates_presence_of :email
    validates_length_of :email, :maximum => 100
    validates_format_of :email, :with => EMAIL_REGEX
    # validates_confirmation_of :email

end
