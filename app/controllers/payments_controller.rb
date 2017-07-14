class PaymentsController < ApplicationController
  before_action :set_payment

  require 'paypal-sdk-rest'
  include PayPal::SDK::REST



  # Create Payment and return the status(true or false)
  def check_out
    if @payment.create
      # Redirect the user to given approval url
      @redirect_url = @payment.links.find{|v| v.rel == "approval_url" }.href
      return redirect_to @redirect_url
    else
      redirect_to carrito_path, notice: "Error: #{@payment.error.details[0].issue}"
    end
  end

  def execute
    payment = Payment.find(params[:paymentId])

    if payment.execute( :payer_id => params[:PayerID] )
      @shopping_cart.payed!
      encrypted_id = Digest::MD5.hexdigest("#{payment.id}")
      order = MyOrder.create!(shopping_cart: @shopping_cart, total: @shopping_cart.total, permanent_link: encrypted_id,
                    recipient_name: payment.payer.payer_info.shipping_address.recipient_name, line1: payment.payer.payer_info.shipping_address.line1,
                    line2: payment.payer.payer_info.shipping_address.line2, city: payment.payer.payer_info.shipping_address.city,
                    country_code: payment.payer.payer_info.shipping_address.country_code, postal_code: payment.payer.payer_info.shipping_address.postal_code,
                    phone: payment.payer.payer_info.shipping_address.phone, state: payment.payer.payer_info.shipping_address.state)
      cookies[:shopping_cart_id] = {expires: Time.now}
      redirect_to my_order_path(id: order.permanent_link)
    else
      raise payment.error.to_yaml # Error Hash
    end
  end

  private

    def set_payment
      puts @shopping_cart.total
      puts @shopping_cart.subtotal
      puts @shopping_cart.shipping_discount
      @payment = Payment.new({
        :intent =>  "sale",
        :payer =>  {
          :payment_method =>  "paypal" },
        :redirect_urls => {
          :return_url => execute_payment_url,
          :cancel_url => carrito_url },
        :transactions =>  [{
          :item_list => {
            :items => @shopping_cart.items},
          :amount =>  {
            :total =>  @shopping_cart.total,

            :currency =>  "MXN",
            :details => {
              :subtotal => @shopping_cart.subtotal,
              :shipping => 150,
              :shipping_discount => @shopping_cart.shipping_discount
            }},
          :description =>  "This is the payment transaction description." }],
          :note_to_payer => "No olvides verificar tu direccion de envio."
          })
    end

end
