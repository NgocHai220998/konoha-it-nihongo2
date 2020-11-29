Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|vi/ do
    root "static_pages#home"
    resources :users, only: [:index, :create, :edit, :update, :delete]
    resources :password_resets, only:[:new, :create, :edit, :update]
    resources :comments, only:[:create, :update, :destroy]
    resources :likes, only:[:create, :destroy]
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/profile", to: "users#edit"
    post "/profile", to: "users#update"
    resources :posts, only: [:index, :new, :create, :edit, :update, :delete, :show]
  end
end
