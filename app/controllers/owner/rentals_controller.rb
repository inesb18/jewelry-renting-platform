class Owner::RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental).select { |rental| rental.product.user == current_user }
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
