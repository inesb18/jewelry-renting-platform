class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @category = params[:category]
    if %w(necklaces earrings bracelets rings sets other).include?(@category)
      @title = @category
      @products = Product.all.select {|p| p.category == @category}
    else
      @category = "all"
      @title = "all jewelry"
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :category)
  end
end
