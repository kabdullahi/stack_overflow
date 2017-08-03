Rails.application.routes.draw do
 resources :questions do
  resources :answers
 end
 resources :users, except: [:index, :destroy]
 get "/sessions" => "sessions#destroy"
 resources :sessions, only: [:new, :create]
 root "questions#index"
end
