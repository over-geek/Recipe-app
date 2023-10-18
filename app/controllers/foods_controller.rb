class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i[show destroy]
  # load_and_authorize_resource except: [:show]

  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food item added successfully.'
    else
      render :new
    end
  end

  def show
    if @food.destroy
      redirect_to foods_path, notice: 'Food item deleted.'
    else
      redirect_to foods_path, alert: 'Failed to delete food item.'
    end
  end

  def set_food
    @food = current_user.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :quantity, :price)
  end
end
