Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "/mock/document", to: redirect("/limitless/Documentation/index.html")
  get "/mock/layout", to: redirect("/limitless/layout/index.html")

  root "dashboards#index"

  resources :users
  resources :shops, only: [:new, :create, :index]

  get "/set_current_shop" => "shops#set_current_shop"

  get "*path", to: "application#rescue404" unless Rails.application.config.consider_all_requests_local
end
