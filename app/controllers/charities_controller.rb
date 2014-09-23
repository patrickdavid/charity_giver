class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
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
