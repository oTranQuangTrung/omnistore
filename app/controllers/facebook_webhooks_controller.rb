class FacebookWebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def show
    if ENV["facebook_webhook_verify_token"] == params["hub.verify_token"]
      render plain: params["hub.challenge"]
    end
  end

  def create
    BroadcastFacebookMessage.new.execute params
  end
end
