class AuditLogPolicy < ApplicationPolicy
  def index?
    admin?
  end

  private

  def admin?
    admin_types.include?(user.type)
  end
end