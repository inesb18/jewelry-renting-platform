class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @category = params[:category]
    if %w(necklaces earrings bracelets rings sets other).include?(@category)
      @title = @category
      @products = policy_scope(Product).select {|p| p.category == @category}
    else
      @category = "all"
      @title = "all jewelry"
      @products = policy_scope(Product)
    end
  end

  def show
    @product = Product.find(params[:id])
    authorize(@product)
  end

  def new
    @product = Product.new
    authorize(@product)
  end

  def create
    @product = Product.new(product_params)
    authorize(@product)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize(@product)
  end

  def update
    product = Product.find(params[:id])
    authorize(product)
    product.update(product_params)
    redirect_to product_path(product)
  end

  def destroy
    product = Product.find(params[:id])
    authorize(product)
    product.destroy
    # redirect_to owner_products_path
    redirect_to products_path
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :category)
  end
end
