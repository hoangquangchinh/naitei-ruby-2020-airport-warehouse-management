Rails.application.routes.draw do
  scope "(:locale)", locale: /vi|en/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to:"sessions#destroy"
    resources :users, except: %i(edit update)
    resources :schedules, only: %i(new create)
    resources :locations, only: :index
    resources :planes, only: :index
  end
end
