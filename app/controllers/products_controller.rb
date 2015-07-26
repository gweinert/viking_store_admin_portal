class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.where(:product_id => @product.id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_hash)
    if @product.save
      flash[:success] = "Product Created Successfully"
      redirect_to products_path
    else 
      flash.now[:error] = "Failed to created Product. Please Try again"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params_hash)
      redirect_to products_path
      flash[:success] = "Product Updated"
    else
      flash.now[:error] = "Failed to update. Please Try again"
      render :edit
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "OBLITERATED"
    redirect_to products_path
  end
  
  private

    def params_hash
      params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
