class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.product.user != user
  end

  def create?
    new?
  end

  def confirm?
    record.product.user == user
  end

  def decline?
    record.product.user == user
  end
end
