class Owner::RentalsController < ApplicationController
  def index
    @rentals = []
    current_user.products.each do |prod|
      prod.rentals.each do |rental|
        @rentals << rental
      end
    end
  end

  def confirm
    @rental = Rental.find(params[:rental_id])
    @rental.confirmed = true
    @rental.save
    redirect_to owner_rentals_path
  end

  def decline
    @rental = Rental.find(params[:rental_id])
    @rental.declined = true
    @rental.save
    redirect_to owner_rentals_path
  end
end
