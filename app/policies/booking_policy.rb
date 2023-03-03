class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user || record.drag.user == user
  end

  def destroy?
    record.user == user || record.drag.user == user
  end

  def accept?
    record.user == user || record.drag.user == user
  end

  def decline?
    record.user == user || record.drag.user == user
  end
end
