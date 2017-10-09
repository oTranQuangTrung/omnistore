class BroadcastFacebookMessage < BaseService
  def execute facebook_messages_params
    facebook_messages_params["entry"].each do |entry|
      ActionCable.server.broadcast "facebook_messages_for_page_#{entry["id"]}",
        messaging: entry["messaging"]
    end
  end
end
