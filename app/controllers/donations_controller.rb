class DonationsController < ApplicationController
  def index
    @donations_for_user = Donation.where(:user_id => current_user.id)
  end
  def new
    @donation = Donation.new
    @charity = Charity.find(params[:charity_id])
    @user = User.find(current_user)
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      flash[:notice] = "donation added to cart"
      redirect_to root_path
    else
      flash[:notice] = "something went wrong"
      render 'new'
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    flash[:notice] = "Your donation has been deleted from you shopping cart"
    redirect_to user_charity_donations_path(:user_id => current_user.id, :charity_id => params[:charity_id])
  end

  private
  def donation_params
    params.require(:donation).permit(:amount, :charity_id, :user_id)
  end
end
