class Renter::RentalsController < ApplicationController
  def index
    @renter = true
    @rentals = current_user.rentals
  end

  def show
    @rental = Rental.find(params[:id])
  end
end
