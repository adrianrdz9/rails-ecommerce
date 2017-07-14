class HomeController < ApplicationController
  def index
    if user_signed_in? && !current_user.client?
      @products = Product.all
      @orders = MyOrder.all
      return render "home/admin"
    else
      @products = Product.all
      return render "home/index"
    end
  end
end
