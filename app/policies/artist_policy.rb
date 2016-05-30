class ArtistPolicy < ApplicationPolicy

  def create?
    user.present? && user.admin?
  end

  def update?
    user.present? && ((user.musician? && record.user == user) || user.admin?)
  end

  def destroy?
    create?
  end

  def stats?
    update?
  end

end