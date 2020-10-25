class Post < ApplicationRecord
  belongs_to :user
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }

  scope :all_posts_of, ->(user) { where(user_id: user.id) }
end
