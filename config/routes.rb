Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|vi/ do
    root "static_pages#home"
    resources :users, only: [:index, :create, :edit, :update, :delete]
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/profile", to: "users#edit"
    post "/profile", to: "users#update"
  end
end
