class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(:catergy_id => @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params_hash)
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end
  
  private

    def params_hash
      params.require(:category).permit(:name, :description)
    end
end
