class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    # has_secure_password
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


    # class << self
    #   def serialize_from_session(key,salt)
    #     record = to_adapter.get(key[0].to_param)
    #     record if record && record.authenticatable_salt == salt
    #   end
    # end

end
