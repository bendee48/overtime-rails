class AuditLog < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, confirmed: 1 }
  validates_presence_of :status, :start_date
  
  after_initialize :set_start_date
  before_update :set_end_date, if: :confirmed?

  private
    def set_start_date
      self.start_date ||= six_days_ago
    end

    def set_end_date
      self.end_date = Date.today
    end

    def six_days_ago
      Date.today - 6.days
    end
end

