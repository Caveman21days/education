Rails.application.routes.draw do
  devise_for :users

  resources :fields do
    resources :user_assignments, shallow: true

    resources :projects, shallow: true do
      resources :user_assignments, shallow: true
    end

    resources :courses, shallow: true do
      resources :user_assignments, shallow: true
    end
  end

  resources :users

  root to: 'fields#index'
end
