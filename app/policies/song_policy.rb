class SongPolicy < ApplicationPolicy

  def create?
    user.present? && (record.user == user || user.admin?)
  end

  def update?
    create?
  end

end