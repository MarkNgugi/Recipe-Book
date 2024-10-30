class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build(ingredient_params)

    if @ingredient.save
      redirect_to @recipe, notice: "Ingredients added"
    else
      render "recipe/show"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    if @ingredient.destroy
      redirect_to recipe_path(@recipe), notice: "Ingredient deleted successfully."
    else
      redirect_to recipe_path(@recipe), alert: "Failed to delete ingredient."
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
