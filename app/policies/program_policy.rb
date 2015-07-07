class ProgramPolicy < ApplicationPolicy

  def create?
    user.present? && user.admin?
  end

  def destroy?
    create?
  end

  def update?
    create?
  end

end