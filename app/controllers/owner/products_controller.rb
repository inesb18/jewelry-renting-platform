class Owner::ProductsController < ApplicationController
  def index
    @product = Product.new
    @products = policy_scope(Product).where(user: current_user)
  end
end
