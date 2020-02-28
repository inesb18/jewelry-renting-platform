class Renter::RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental).where(user: current_user)
    @renter = true
    @status = params[:status]
    if @status == "confirmed"
      @rentals = @rentals.select { |rental| rental.confirmed && !rental.declined }
      @rentals = @rentals.reject { |rental| rental.end_date <= Date.today }
    elsif @status == "declined"
      @rentals = @rentals.select { |rental| rental.declined }
    elsif @status == "past"
      @rentals = @rentals.select { |rental| rental.confirmed && !rental.declined }
      @rentals = @rentals.select { |rental| rental.end_date < Date.today }
    else
      @status = "pending"
      @rentals = @rentals.select { |rental| !rental.declined && !rental.confirmed }
    end
  end
end
