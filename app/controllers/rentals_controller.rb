class RentalsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @rental = Rental.new
  end
end
