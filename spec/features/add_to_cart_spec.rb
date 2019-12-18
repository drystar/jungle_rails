require 'rails_helper'

RSpec.feature "Clicks add to cart from home page and cart goes up by 1", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )      
    end
  end

  scenario "They see the cart go up by 1" do
    # ACT
    visit root_path
    # puts page.html
    first('.button_to').click
    page.has_content?('My Cart (1)');

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
end