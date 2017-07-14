class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:name]) or not_found
    @products = Product.where("category = ?", @category.name)
  end

end
