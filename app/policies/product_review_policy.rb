class ProductReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.product.rentals.each do |rental|
      if rental.user == user
        return true
      end
    end
    return false
  end

end
