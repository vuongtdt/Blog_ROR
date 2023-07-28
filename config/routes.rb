Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  devise_scope :user do
    get "/login" => "devise/sessions#create"
    post "/signup" => "devise/sessions#new"
    delete "/signout" => "devise/sessions#destroy"
  end
  resources :users
  resources :posts
  resources :home
end

