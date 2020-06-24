Rails.application.routes.draw do
  resources :results
  resources :users do
    resources :results
  end

  post "login", to: "authenticate#login"
end