class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "You have created a recipe"
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
