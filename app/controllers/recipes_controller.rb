class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_recipes = Recipe.where(user_id: current_user.id)
    @user = current_user
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe # Check authorization to delete the post
    @recipe.destroy
    redirect_to recipes_path, notice: 'Post was successfully deleted.'
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe added successfully.'
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
