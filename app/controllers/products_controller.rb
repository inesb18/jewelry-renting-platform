class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @title = "All Jewelry"
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :category)
  end
end
