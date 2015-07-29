class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params_list)
    if @order.save
      flash[:success] = "Order Created!"
      redirect_to order_path
    else
      flash[:error] = "Failed to Create Order!"
      render :new
  end

  def edit
    @order = Order.find(params[:id])
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
end
