require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'validation' do

    it 'returns a product' do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create(
        name: 'test name',
        price: 19.95,
        quantity: 10
      )
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end 
    
    it 'returns the name' do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create(name: 'test name')
      expect(@product).to have_attributes(name: 'test name')
    end

    it 'returns the price' do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create(price: 19.95)
      expect(@product).to have_attributes(price: 19.95)
    end

    it 'returns the quantity' do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create(quantity: 10)
      expect(@product).to have_attributes(quantity: 10)
    end

    it 'returns the category' do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create
      expect(@product.category).to have_attributes(name: 'Apparel')
    end
  end

end
