class FacebookWebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def show
    render plain: params["hub.challenge"]
  end

  def create
    # binding.pry
  end
end
