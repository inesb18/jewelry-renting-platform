class Renter::RentalsController < ApplicationController
  def index
    @rentals = []
    current_user.products.each do |prod|
      @rentals + prod.rentals
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end
end
