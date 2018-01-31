class CategoriesController < ApplicationController
  def index
    @categories = Category.sorted
  end

  def show
      @category = Category.find(params[:id])
      @categories = Category.sorted
      @recipes = @category.recipes
      render('recipes/index')
  end

  def new
      @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    valid_record?(@category, "Categoría '#{@category.name}' creada exitosamente.", categories_path, 'new')
  end

  # def just_save
  #     @category = Category.new(category_params)
  #     @category.save
  # end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    valid_record?(@category, "Categoría '#{@category.name}' editada exitosamente.", categories_path, 'edit')
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash_redirect("Categoría '#{@category.name}' eliminada.", categories_path)
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
