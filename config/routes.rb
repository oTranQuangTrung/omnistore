Rails.application.routes.draw do
  get "/mock/document", to: redirect("/limitless/Documentation/index.html")
  get "/mock/layout", to: redirect("/limitless/layout/index.html")

  root "dashboards#index"
end
