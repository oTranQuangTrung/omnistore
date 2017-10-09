class FacebookMessagesChannel < ApplicationCable::Channel
  def subscribed
    if verify_facebook_page_owner
      stream_from "facebook_messages_for_page_#{params[:facebook_id]}"
    else
      # TODO Alert invalid access
    end
  end

  private

  def verify_facebook_page_owner
    current_user.ownable? FacebookPage.find_by(facebook_id: params[:facebook_id])
  end
end
