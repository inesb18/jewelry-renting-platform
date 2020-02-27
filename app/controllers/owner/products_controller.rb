class Owner::ProductsController < ApplicationController
  def index
    @products = policy_scope(Product).where(user: current_user)
  end
end
