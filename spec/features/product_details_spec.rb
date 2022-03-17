require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to a product detail page", type: :feature, js: true do
  
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

  scenario "They click on a product and renders it's detail page" do
    # ACT
    visit root_path
    click_on('Details', match: :first)

    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show'
  end

end
