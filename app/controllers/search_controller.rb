class SearchController < ApplicationController
  def search
    @search = params[:search]
    @results = Product.where("title LIKE ? OR description LIKE ?", "%#{@search}%", "%#{@search}%")

    return render("search/search")
  end
end
