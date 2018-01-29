class Category < ApplicationRecord
    has_many :recipes
    validates :name, :presence => true, :length => { :minimum => 3 }, :uniqueness => true


    scope :sorted, -> { order("name ASC") }
end
