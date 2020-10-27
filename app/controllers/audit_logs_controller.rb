class AuditLogsController < ApplicationController
  def index
    authorize AuditLog
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
