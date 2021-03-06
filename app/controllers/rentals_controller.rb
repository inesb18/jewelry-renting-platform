class RentalsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @rental = Rental.new
    @rental.product = @product
    authorize(@rental)
  end

  def create
    @rental = Rental.new(rental_params)
    @product = Product.find(params[:product_id])
    @rental.product = @product
    authorize(@rental)
    @rental.user = current_user
    if @rental.save
      redirect_to renter_rentals_path
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date,:end_date)
  end
end
