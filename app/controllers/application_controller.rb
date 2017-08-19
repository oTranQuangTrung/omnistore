class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  def rescue404
    render "errors/not_found", status: 404, layout: "devise"
  end

  def current_user? user
    current_user == user
  end
end
