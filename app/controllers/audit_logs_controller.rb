class AuditLogsController < ApplicationController
  def index
    authorize AuditLog
    @audit_logs = AuditLog.page(params[:page]).per(10)
  end

  def confirm
    @audit_log = AuditLog.find(params[:id])
    authorize @audit_log
    @audit_log.confirmed!
    sweetalert('Overtime has been confirmed.', 'Confirmed', timer: 3000, position: 'top-end', toast: true, icon: 'success', background: '#EEEEFF')
    redirect_to root_path
  end

  private

  # Overide for AuditLog alternative redirect path
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
