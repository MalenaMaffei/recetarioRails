class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :recipes

    validates :username, uniqueness: true
end
