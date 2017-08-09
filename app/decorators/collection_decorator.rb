class CollectionDecorator < ApplicationDecorator
  delegate_all

  include ApplicationHelper
  include ActionView::Helpers

  def featured_image_display
    featured_image_url || default_image_path
  end

  def name_display
    public ? truncated_name : inactive_name
  end

  def description_display
    description.truncate Settings.truncate.long
  end

  private
  def truncated_name
    name.truncate Settings.truncate.short
  end

  def inactive_name
    "#{truncated_name} " << content_tag(:span, I18n.t("collections.collection.inactive"), class: "label bg-grey-400")
  end
end
