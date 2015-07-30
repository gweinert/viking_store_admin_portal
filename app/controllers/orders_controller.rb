class OrdersController < ApplicationController

  def index
    if params[:user_id]
      @user_id = params[:user_id]
      @user = User.find(@user_id)
      @orders = Order.where("user_id = ?", params[:user_id])
    else
      @orders = Order.all
    end
  end

  def new
    @user = User.find(params[:user_id])
    @order = @user.orders.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params_list)
    @order.save
      # flash[:success] = "Order Created!"
      redirect_to edit_user_order_path(@order.user.id, @order)
    # else
      # flash[:error] = "Failed to Create Order!"
      # render :new
    # end
  end

  def edit
    @order = Order.find(params[:user_id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(param_list)
      flash[:success] = "Order Updated!"
      redirect_to order_path
    else
      flash[:error] = "Could not Update Order"
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:success] = "Order Deleted"
      redirect_to orders_path
    else
      flash[:error] = "Could not Delete Order"
      redirect_to orders_path
    end
  end

  private

    def params_list
      params.require(:order).permit(:checkout_date, :user_id, 
        :shipping_id, :billing_id)
    end



end
