class Owner::RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental).select { |rental| rental.product.user == current_user }
    @status = params[:status]
    if @status == "upcoming"
      @rentals = @rentals.select { |rental| rental.confirmed && !rental.declined }
      @rentals = @rentals.select { |rental| rental.start_date > Date.today }
    elsif @status == "current"
      @rentals = @rentals.select { |rental| rental.confirmed && !rental.declined }
      @rentals = @rentals.select { |rental| rental.start_date <= Date.today && rental.end_date > Date.today }
    elsif @status == "past"
      @rentals = @rentals.select { |rental| rental.confirmed && !rental.declined }
      @rentals = @rentals.select { |rental| rental.end_date < Date.today }
    else
      @status == "pending"
      @rentals = @rentals.select { |rental| !rental.declined && !rental.confirmed }
    end
  end

  def confirm
    @rental = Rental.find(params[:rental_id])
    authorize(@rental)
    @rental.confirmed = true
    @rental.save
    redirect_to owner_rentals_path
  end

  def decline
    @rental = Rental.find(params[:rental_id])
    authorize(@rental)
    @rental.declined = true
    @rental.save
    redirect_to owner_rentals_path
  end
end
