class CommentPolicy < ApplicationPolicy

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