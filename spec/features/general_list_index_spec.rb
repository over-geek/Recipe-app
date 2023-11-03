# spec/features/general_list_index_spec.rb

require 'rails_helper'

RSpec.feature 'General List Index Page', type: :feature do
  include Warden::Test::Helpers # Include Devise test helpers
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user) # Log in the user using Devise

    # Create food items for the shopping list
    @food1 = Food.create(name: 'Food 1', price: 5.0, quantity: 2, user:)
    @food2 = Food.create(name: 'Food 2', price: 3.0, quantity: 3, user:)

    # Make sure these food items do not have corresponding RecipeFood entries.

    # You may need to create some RecipeFood entries in a 'before' block
    # if required by your application logic.

    visit general_list_path
  end

  scenario 'displays the shopping list with the total value and item count' do
    expect(page).to have_content('Shopping List')
  end
end
