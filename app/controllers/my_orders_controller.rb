class MyOrdersController < ApplicationController
  def show
    @order = MyOrder.find_by("permanent_link = ?", params[:id])
  end
end
