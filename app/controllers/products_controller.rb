class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @category = params[:category]
    @near_me = params[:near_me]
    @products = policy_scope(Product)
    if @near_me == "true" && current_user
      users_near = User.near(current_user.address, 20)
      @products = policy_scope(Product).select{ |p| users_near.include?(p.user) }
    end
    if %w(necklaces earrings bracelets rings sets other).include?(@category)
      @title = @category
      @products = @products.select {|p| p.category == @category}
    else
      @category = "all"
      @title = "all jewelry"
    end
  end

  def show
    @rental = Rental.new
    @product = Product.find(params[:id])
    @rental.product = @product
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

  def near_me
    @products = Product.all
    @title = 'Jewels near you'
    render :index
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
    redirect_to owner_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :category)
  end
end
