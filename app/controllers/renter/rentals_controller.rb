class Renter::RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental).where(user: current_user)
    @renter = true
  end
end
