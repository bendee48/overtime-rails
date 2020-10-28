class StaticController < ApplicationController
  def homepage
    if helpers.admin?
      @pending_approvals = Post.submitted
      @audit_logs = AuditLog.last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs
    end
  end
end