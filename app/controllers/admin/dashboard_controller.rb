class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  
  def show
    @total_products = Product.all.count
    @total_categories = Category.all.count
  end  
end
