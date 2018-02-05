class RecipesController < ApplicationController
  layout "shared", only: [:show_shareable]

  before_action :confirm_permissions, :only => [:edit, :update, :destroy]



  def index
      @categories = Category.sorted
      @results = {}
      if params[:search]
          # @recipes = Recipe.search(params[:search]).sorted
          @categories.each do |category|
            @results[category.name] = category.recipes.search(params[:search]).sorted
          end
      elsif params[:user]
          # @recipes = Recipe.where(:user => params[:user]).includes(:category).order("categories.name ASC").sorted
          @categories.each do |category|
            @results[category.name] = category.recipes.where(:user => params[:user]).sorted
          end
      else
          @categories.each do |category|
            @results[category.name] = category.recipes.sorted
          end
          # @recipes = Recipe.includes(:category).order("categories.name ASC").sorted
      end



  end

  def show
      @recipe = Recipe.find(params[:id])
      @comment = Comment.new
      @comments = Comment.all
  end

  def show_shareable
      # @categories = Category.all
      # @comment = Comment.new
      # @comments = Comment.all
      @recipe = Recipe.find_by :token => params[:token]
      # render(:partial => 'receta')
  end

  def new
      @category = Category.new
      @recipe = Recipe.new
  end

  def new_version
      parent = Recipe.find(params[:id])
      @recipe = Recipe.new(parent.attributes)
      @recipe.name = @recipe.name + ": version ..."
      render('new')
  end

  def create
    ingredients = recipe_params[:ingredients].split(',')
    # ingredients.map!(&:strip)
    # @recipe = Recipe.new(recipe_params.merge({ingredients:ingredients}))
    # @recipe.save
    # valid_record?(@recipe, "Receta '#{@recipe.name}' creada exitosamente.", recipes_path, 'new')



    @user = current_user
    @recipe = @user.recipes.build(recipe_params.merge({ingredients:ingredients}))
    # @recipe.instructions = simple_format(@recipe.instructions)
    @recipe.save
    # valid_record?(@recipe, "Receta '#{@recipe.name}' creada exitosamente.", recipe_path(@recipe), 'new')
    if @recipe.valid?
      flash_redirect("Receta '#{@recipe.name}' editada exitosamente.", recipe_path(@recipe))
    else
      render('new')
    end

  end

  def edit
    @category = Category.new
    @recipe = Recipe.find(params[:id])
  end



  def update
    ingredients = recipe_params[:ingredients].split(',')
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(recipe_params.merge({ingredients:ingredients}))
    # @recipe.instructions = simple_format(@recipe.instructions)
    # valid_record?(@recipe, "Receta '#{@recipe.name}' editada exitosamente.", recipe_path(@recipe), 'edit')
    if @recipe.valid?
      flash_redirect("Receta '#{@recipe.name}' editada exitosamente.", recipe_path(@recipe))
    else
      render('edit')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash_redirect("Receta '#{@recipe.name}' eliminada.", recipes_path)
  end


    private

    def recipe_params
      params.require(:recipe).permit(:name, :category_id, :ingredients, :key_words, :instructions, :user_id, :parent_id, :image)
    end


    def confirm_permissions
      recipe = Recipe.find(params[:id])
      unless helpers.allowed?(recipe.user)
        flash_redirect("No tenes permisos para realizar esa accion.", recipe_path(recipe))
      end
    end


end
