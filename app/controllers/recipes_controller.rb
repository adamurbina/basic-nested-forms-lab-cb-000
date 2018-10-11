class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "1")
    @recipe.ingredients.build(name: "2")
    @recipe.save
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title)
  end
end
