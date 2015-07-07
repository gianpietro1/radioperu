class SongPolicy < ApplicationPolicy

  def create?
    user.present? && (record.album.artist.user == user || user.admin?)
  end

  def update?
    create?
  end

end