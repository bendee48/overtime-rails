module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def status_tag(status)
    content_tag(:span, "#{status.capitalize}", class: "badge badge-#{labels[status]}")
  end

  def admin?
    admin_types.include?(current_user.type)
  end

  def employee?
    current_user.type == 'Employee'
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  private

  def admin_types
    ['AdminUser']
  end

  def labels
    {'submitted' => 'info',
     'approved' => 'success',
     'rejected' => 'danger',
     'pending' => 'info',
     'confirmed' => 'success'}
  end
end
