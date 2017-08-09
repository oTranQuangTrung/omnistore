module ApplicationHelper
  def full_title page_title
    base_title = t "app_name"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def current_controller? *args
    args.any? do |v|
      v.to_s.downcase == controller.controller_name || v.to_s.downcase == controller.controller_path
    end
  end

  def current_action? *args
    args.any? { |v| v.to_s.downcase == action_name }
  end

  def active_when condition
    'active' if condition
  end

  def show_errors object, field_name
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        object.errors.messages[field_name].join ", "
      end
    end
  end

  def default_image_path
    "placeholder.jpg"
  end

  def flash_class name
    case name
    when "alert"
      "bg-warning"
    when "info"
      "bg-info"
    when "success"
      "bg-success"
    else
      "bg-info"
    end
  end

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if /class=.*hide_error.*/ =~ html_tag || /type=.*hidden.*/ =~ html_tag
      html_tag
    else
      if instance.error_message.kind_of? Array
        error_msg = ""
        instance.error_message.each do |message|
          error_msg += %(<label class="validation-error-label">#{message}</label>)
        end
        error_msg
      else
        error_msg = %(<label class="validation-error-label">#{instance.error_message}</label>)
      end
      if /class=.*top_error.*/ =~ html_tag
        "#{error_msg}#{html_tag}"
      else
        "#{html_tag}#{error_msg}"
      end
    end.html_safe
  end

end
