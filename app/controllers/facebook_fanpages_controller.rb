class FacebookFanpagesController < ApplicationController
  def index
    @pages = Facebook::GetFanpageService.call current_user
  end
end
