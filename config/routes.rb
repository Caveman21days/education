Rails.application.routes.draw do
  devise_for :users

  resources :fields do
    resources :projects, shallow: true
    resources :courses, shallow: true
  end

  root to: 'fields#index'
end
