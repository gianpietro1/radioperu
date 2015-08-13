class AlbumPolicy < ApplicationPolicy

  def create?
    user.present? && ((user.musician? && record.user == user) || user.admin?)
  end

  def update?
    create?
  end

  def new?
    user.present? && (user.musician? || user.admin?)
  end

end