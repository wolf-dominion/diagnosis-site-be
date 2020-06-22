Rails.application.routes.draw do
  resources :results
  resources :users, only: [:index, :show, :create, :delete] do
    resources :results
  end

  post "login", to: "authenticate#login"
end