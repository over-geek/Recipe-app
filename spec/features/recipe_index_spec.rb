# spec/features/recipe_index_spec.rb

require 'rails_helper'

RSpec.feature 'Recipe Index Page', type: :feature do
  include Warden::Test::Helpers
  let(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user:) } # Assuming you have FactoryBot set up for user and recipe creation

  before do
    login_as(user, scope: :user) # Log in the user using Devise
  end

  scenario 'displays a list of user recipes' do
    visit recipes_path

    # Assuming you have the correct CSS selectors, modify these as needed
    expect(page).to have_content('Recipes') # Check for the heading
    expect(page).to have_content(recipe.description)
  end

  scenario 'displays a "Create Recipe" button' do
    visit recipes_path

    expect(page).to have_link('Create Recipe', href: new_recipe_path)
  end
end
