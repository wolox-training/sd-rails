class RentPolicy < ApplicationPolicy
  def create?
    record.user == user
  end
end
