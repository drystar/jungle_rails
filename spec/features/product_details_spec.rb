require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg")
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "User navigates to product detail page by clicking on the product from home page" do
    # ACT
    visit root_path
    page.find('products .product:first-child a.btn').clicking

    # DEBUG
    save_screensho("home_to_product.png")

    # VERIFY
    expect(page).to have_css 'article.product-detail', count: 10
  end
end