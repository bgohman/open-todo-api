class ListPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present? && (user == record.user)
  end
end
