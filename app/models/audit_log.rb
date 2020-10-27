class AuditLog < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, confirmed: 1 }
  validates_presence_of :status, :start_date
  validate :start_date_must_be_six_days_ago
  after_initialize :set_start_date

  private
    def set_start_date
      self.start_date ||= six_days_ago
    end

    def start_date_must_be_six_days_ago
      unless start_date == six_days_ago
        errors.add(:start_date, 'must be 6 days ago')
      end
    end

    def six_days_ago
      Date.today - 6.days
    end
end

