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
end
