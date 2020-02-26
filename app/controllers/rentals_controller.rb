class RentalsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @product = Product.find(params[:product_id])
    @rental.product = @product
    @rental.user = current_user
    if @rental.save
      new_un = Unavailability.create(product: @product, start_date: @rental.start_date, end_date: @rental.end_date)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date,:end_date)
  end
end
