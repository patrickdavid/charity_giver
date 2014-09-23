class ChargesController < ApplicationController
  def new
    if current_user
    @amount = Charity.count_cart_int(current_user)
    end

  end

def create
  # Amount in cents
  if current_user
  @amount = Charity.count_cart_int(current_user)
  end

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
