class Category < ApplicationRecord
    before_destroy :default_category
    has_many :recipes, dependent: :nullify
    before_validation :titleize_name, on: :create
    validates :name, :presence => true, :length => { :minimum => 3 }, :uniqueness => true

    scope :sorted, -> { order("name ASC") }




    def titleize_name
      self.name = name.titleize
    end

    def default_category
      self.recipes.each do |recipe|
          recipe.category = Category.find_by(:name => 'Misc')
          recipe.save
      end
      # r = self.recipes.first
      # r.category = Category.find_by(:name => 'Misc')
      # r.save
    end
end
