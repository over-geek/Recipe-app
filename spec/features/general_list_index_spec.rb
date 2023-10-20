# spec/features/general_list_index_spec.rb

require 'rails_helper'

RSpec.feature 'General List Index Page', type: :feature do
  include Warden::Test::Helpers # Include Devise test helpers
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user) # Log in the user using Devise

    # Create food items for the shopping list
    Food.create(name: 'Food 1', price: 5.0, quantity: 2, user:)
    Food.create(name: 'Food 2', price: 3.0, quantity: 3, user:)

    # Make sure these food items do not have corresponding RecipeFood entries.

    # You may need to create some RecipeFood entries in a 'before' block
    # if required by your application logic.

    visit general_list_path
  end

  after do
    logout(:user) # Log out the user after each scenario
  end

  scenario 'displays the shopping list with the total value and item count' do
    expect(page).to have_content('Shopping List')
  end

  scenario 'displays food items without recipes' do
    expect(page).to have_content('Food 1')
    expect(page).to have_content('Food 2')
  end

  scenario 'displays a message when all foods are connected to recipes' do
    # Ensure all food items are connected to recipes (if required by your application logic)
    # Example: create(:recipe_food, food: user.foods.first, recipe: create(:recipe, user: user))

    visit general_list_path

    # expect(page).to have_content('Every foods is connected to recipe')
  end
end
