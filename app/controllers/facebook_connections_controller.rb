class FacebookConnectionsController < ApplicationController
  def create
    if current_shop.connect_to_facebook_page facebook_page
      flash[:success] = t ".success"
      redirect_to facebook_chat_path
    else
      flash[:alert] = t ".alert"
      redirect_to request.referer
    end
  end

  def destroy
    if current_shop.disconnect_facebook_page facebook_page
      flash[:success] = t ".success"
      redirect_to facebook_pages_path
    else
      flash[:alert] = t ".alert"
      redirect_to request.referer
    end
  end

  private

  def facebook_page
    user_graph_api = Facebook::GraphApiService.call current_user.facebook_access_token

    facebook_page_id = params[:facebook_page_id]
    access_token = user_graph_api.get_page_access_token facebook_page_id

    FacebookPage.new id: facebook_page_id, access_token: access_token
  end
end
