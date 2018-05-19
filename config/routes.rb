Rails.application.routes.draw do

  root 'courses#index'
  devise_for :users

  resources :courses do
    resources :projects do
      resources :tasks
    end
  end
end
