class Recipe < ApplicationRecord
    serialize :ingredients
    # serialize :key_words
    belongs_to :category
    belongs_to :user
    has_many :comments

    before_validation :generate_token, on: :create

    validates :token, presence: true
    validates :token, uniqueness: true

    validates :name, :presence => true, :length => { :minimum => 3 }
    validates :ingredients, :presence => true, :length => { :minimum => 1 }
    validates :key_words, :presence => true, :length => { :minimum => 1 }
    validates :instructions, :presence => true, :length => { :minimum => 10 }

    scope :search, lambda {|query| where(["name ILIKE ? OR key_words ILIKE ?", "%#{query}%", "%#{query}%"]) } #esto es seguro! porque es saneado query
    scope :sorted, -> { order("category_id ASC, name ASC") }

    def generate_token
      begin
        self.token = SecureRandom.urlsafe_base64(16, false)
      end while self.class.find_by(token: token)
    end

    # def to_param
    #   token
    # end
end
