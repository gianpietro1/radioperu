class SongPolicy < ApplicationPolicy

  def create?
    user.present? && ((user.musician? && record.user == user) || user.admin?)
  end

  def update?
    create?
  end

end