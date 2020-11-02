class AuditLogsController < ApplicationController
  def index
    authorize AuditLog
    @audit_logs = AuditLog.page(params[:page]).per(10)
  end

  def confirm
    @audit_log = AuditLog.find(params[:id])
    authorize @audit_log
    @audit_log.confirmed!
    flash.notice = "Hours have been confirmed."
    redirect_to root_path
  end

  private

  # Overide for AuditLog alternative redirect path
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
