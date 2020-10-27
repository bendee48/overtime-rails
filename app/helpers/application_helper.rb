module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def status_tag(status)
    content_tag(:span, "#{status.capitalize}", class: "badge badge-#{labels[status]}")
  end

  def labels
    {'submitted' => 'info',
     'approved' => 'success',
     'rejected' => 'danger',
     'pending' => 'info',
     'confirmed' => 'success'}
  end
end
