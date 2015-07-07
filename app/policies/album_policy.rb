class AlbumPolicy < ApplicationPolicy

  def create?
    user.present? && (record.artist.user == user || user.admin?)
  end

  def update?
    create?
  end

end