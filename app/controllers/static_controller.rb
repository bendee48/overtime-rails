class StaticController < ApplicationController
  def homepage
    @pending_approvals = Post.submitted
    @audit_logs = AuditLog.last(10)
  end
end