class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
    @charge = Charge.new
    @user_donations = Donation.where(:user_id => current_user.id)
    cart_total = []
    @user_donations.each do |donation|
      result = Donation.find_by_id(donation.id)
      donation = Donation.find_by_id(result.id)
      cart_total << donation.amount

    end
    @cart = cart_total.count


    if current_user
      @cart = Donation.where(:user_id => current_user.id)
    end
  end

  def new
    @charity = Charity.new
    @charities = Charity.all
  end

  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      flash[:notice] = "charity created"
      redirect_to root_path
    else
      flash[:notice] = "invalid charity"
      render('charities/new')
    end
  end

  def show
    @charity = Charity.find(params[:id])
  end

private
  def charity_params
    params.require(:charity).permit(:name)
  end
end
