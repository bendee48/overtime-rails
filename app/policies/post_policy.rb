class PostPolicy < ApplicationPolicy
  def update?
    (owned? && pending?) || admin?    
  end

  private

  def owned?
    user.id == record.user_id
  end

  def pending?
    record.status != 'approved'
  end

  def admin?
    admin_types.include?(user.type)
  end
end