Rails.application.routes.draw do
  get 'posts/show'
  scope "(:locale)", locale: /ja|vi/ do
    root "static_pages#home"
    resources :users, only: [:index, :create, :edit, :update, :delete]
    resources :password_resets, only:[:new, :create, :edit, :update]
    resources :posts, only:[:show]
    resources :comments, only:[:create, :update, :destroy]
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
