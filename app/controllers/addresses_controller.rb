class AddressesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @address = Address.new
    @cities = City.all.order(:name)
    @states = State.all.order(:name)
  end

  def create
    @user = User.find(params[:address][:user_id])
    if @user.addresses.create(params_list)
      flash[:success] = "Address Created!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Error: Address Not Created"
      render :new
    end
    
  end

  private

  def params_list
    params.require(:address).permit(:street_address, :zip_code, :city_id, :state_id)
  end

end
