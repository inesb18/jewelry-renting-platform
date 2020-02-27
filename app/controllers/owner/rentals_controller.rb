class Owner::RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental).select { |rental| rental.product.user == current_user }
  end
end
