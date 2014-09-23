class ChargesController < ApplicationController
  def new
    @charge = Charge.new
    if current_user
      @amount = Charity.count_cart_int(current_user)
    end

  end

def create
    @charge = Charge.create(charge_params)
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



   charge_card
   @charge = Charge.new(charge_params)
   if @charge.save

   redirect to where




private
  def charge_card

  end

  def charge_params
    params.require(:charge).permit(:user_id, :amount)
end
