class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end

    def send_receipt(order)
      total = order.total
      text = "Thank you for your Order! Total Charged is $#{total /100}.\n Order Details \n"
      order.line_items.each do |i|
        text += 'Product Name: ' + i.product.name + "\n"
        text += 'Product Quantity: ' + i.product.quantity.to_s + "\n"
    end

      RestClient.post "https://api:5feeee8624223faf20cb34b8ac687e2c-52cbfb43-91be5028"\
      "@api.mailgun.net/v3/sandbox7cbf695f43eb4a31ae9bd983d55001b0.mailgun.org/messages",
        :from => "no-reply@jungle.com",
        :to => order.email,
        :subject => 'Order #' + order.id.to_s,
        :text => text
    end

    order.save!
    send_receipt(order)
    order
  end
end