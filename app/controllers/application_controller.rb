class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :setShoppingCart

  private
    def setShoppingCart
      if cookies[:shopping_cart_id].blank?
        @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)

        cookies[:shopping_cart_id] = @shopping_cart.id

      else

        @shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])

      end
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
