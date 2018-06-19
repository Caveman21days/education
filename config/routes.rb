Rails.application.routes.draw do
  devise_for :users

  resources :fields do
    resources :projects, shallow: true
    resources :courses, shallow: true
  end

  resources :users

  root to: 'fields#index'
end
