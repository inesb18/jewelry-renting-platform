class ProductReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.product.rentals.each do |rental|
      if rental.user == user && rental.start_date <= Date.today
        return true
      end
    end
    return false
  end

end
