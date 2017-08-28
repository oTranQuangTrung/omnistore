Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "/mock/document", to: redirect("/limitless/Documentation/index.html")
  get "/mock/layout", to: redirect("/limitless/layout/index.html")
  root "dashboards#index"

  resources :users
  resources :facebook_pages, only: :index
  resources :shops, only: [:new, :create, :index]
  resources :collections

  resource :facebook_chat, only: :show

  get "/set_current_shop" => "shops#set_current_shop"
  post "/connect_to_facebook_page" => "shops#connect_to_facebook_page"
  post "/disconnect_facebook_page" => "shops#disconnect_facebook_page"

  get "*path", to: "application#rescue404" unless Rails.application.config.consider_all_requests_local
end
