module PostsHelper
  def status_tag(status)
    content_tag(:span, "#{status}", class: "badge badge-#{labels[status]}")
  end

  def labels
    {'submitted' => 'primary',
     'approved' => 'success',
     'rejected' => 'danger'}
  end
end
