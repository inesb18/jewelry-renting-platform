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
      redirect_to renter_rental_path(@rental)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date,:end_date)
  end
end
