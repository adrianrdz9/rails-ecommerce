class InShoppingCartsController < ApplicationController
  def add
    if Product.find(params[:product_id]).stock > 0
      if @shopping_cart.in_shopping_carts.find_by(product_id: params[:product_id])
        @shopping_cart.in_shopping_carts.find_by(product_id: params[:product_id]).update(quantity: @shopping_cart.in_shopping_carts.find_by(product_id: params[:product_id]).quantity + 1)
        Product.find(params[:product_id]).update!(stock: (Product.find(params[:product_id]).stock - 1))
      else
        if InShoppingCart.create!(product_id: params[:product_id], shopping_cart_id: @shopping_cart.id)
          Product.find(params[:product_id]).update!(stock: (Product.find(params[:product_id]).stock - 1))
        end
      end
    else
      return redirect_to products_path, alert: "Ya no contamos con este producto en stock, vuelve a intentarlo mas tarde."
    end

    return redirect_to products_path, notice: "Producto agregado exitosamente."



  end


  def delete
    Product.find(InShoppingCart.find(params[:id]).product_id).update!(stock: (Product.find(InShoppingCart.find(params[:id]).product_id).stock +  InShoppingCart.find(params[:id]).quantity ))
    InShoppingCart.find(params[:id]).destroy
    return redirect_to carrito_path
  end

  def update
    if params[:quantity].to_i <= 0
      Product.find(InShoppingCart.find(params[:in_shopping_cart]).product_id).update!(stock: (Product.find(InShoppingCart.find(params[:in_shopping_cart]).product_id).stock +  InShoppingCart.find(params[:in_shopping_cart]).quantity ))
      InShoppingCart.find(params[:in_shopping_cart]).destroy
      return redirect_to carrito_path, notice: "Producto eliminado"
    end

    if InShoppingCart.find(params[:in_shopping_cart]).quantity > params[:quantity].to_i
      Product.find(InShoppingCart.find(params[:in_shopping_cart]).product_id).update!(stock: (Product.find(InShoppingCart.find(params[:in_shopping_cart]).product_id).stock + (InShoppingCart.find(params[:in_shopping_cart]).quantity - params[:quantity].to_i)))
      InShoppingCart.find(params[:in_shopping_cart]).update!(quantity: params[:quantity])
    else
      if Product.find(InShoppingCart.find(params[:in_shopping_cart]).product_id).stock >= (params[:quantity].to_i - InShoppingCart.find(params[:in_shopping_cart]).quantity)
        Product.find(InShoppingCart.find(params[:in_shopping_cart]).product_id).update!(stock: (Product.find(InShoppingCart.find(params[:in_shopping_cart]).product_id).stock - (params[:quantity].to_i - InShoppingCart.find(params[:in_shopping_cart]).quantity)))
        InShoppingCart.find(params[:in_shopping_cart]).update!(quantity: params[:quantity])
      else
        return redirect_to carrito_path, alert: "Alcanzaste el limite de stock para este producto."
      end
    end
  end
end
