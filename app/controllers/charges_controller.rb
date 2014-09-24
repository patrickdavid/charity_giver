class ChargesController < ApplicationController
  def index
    @charges = Charge.all
    @charge = Charge.create(:user_id => params[:user_id], :amount => params[:amount])
    redirect_to new_charge_path
  end

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
      :email => current_user.email,
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

private

  def charge_params
    params.require(:charge).permit(:user_id, :amount)
  end
end
