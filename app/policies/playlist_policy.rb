class PlaylistPolicy < ApplicationPolicy

  def show?
    record.private == false || (user.present? && (record.user == user || user.admin?))
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def destroy?
    update?
  end

end