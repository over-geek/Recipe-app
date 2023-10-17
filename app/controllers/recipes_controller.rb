class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_recipes = Recipe.where(user_id: current_user.id)
    @user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe # Check authorization to delete the post
    @recipe.destroy
    redirect_to recipes_path, notice: 'Post was successfully deleted.'
  end
end
