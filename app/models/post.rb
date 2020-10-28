class Post < ApplicationRecord
  belongs_to :user
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }
  after_save :update_audit_log

  scope :all_posts_of, ->(user) { where(user_id: user.id) }

  private

  def update_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    audit_log.confirmed! if audit_log
  end
end

