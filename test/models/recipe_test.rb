require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @user = User.create(:username => 'test', :email => 'test@test.com')
    @recipe = @user.recipes.build(:name => 'TestName', :key_words => 'este, es, un, test', :ingredients => 'tomillo, peperoni', :instructions => 'haceme asi y asa', :category_id => 3)
    @recipe.save
  end

  # test "recipe should be valid" do
  #   assert @recipe.valid?
  # end
end
