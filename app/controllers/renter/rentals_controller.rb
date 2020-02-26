class Renter::RentalsController < ApplicationController
  def index
    @rentals = []
    current_user.products.each do |prod|
      prod.rentals.each do |rental|
        @rentals << rental
      end
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end
end
