class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def index
  end

  def new
    @category = Categories.new
  end

  def create
  end
end
