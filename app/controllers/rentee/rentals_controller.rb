class Rentee::RentalsController < ApplicationController
  def index
    @rentals = current_user.rentals
  end

  def show
    @rental = Rental.find(params[:id])
  end
end
