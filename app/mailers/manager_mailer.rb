class ManagerMailer < ApplicationMailer
  def email(manager)
    @manager = manager
    mail(to: manager.email, subject: 'Daily Hours Email')
  end
end
