class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
    # has_secure_password
    has_many :comments, dependent: :destroy
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

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.username = auth.info.name   # assuming the user model has a name
        # user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
   end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
