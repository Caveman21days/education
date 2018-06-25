Rails.application.routes.draw do
  devise_for :users

  resources :fields do
    resources :user_assignments, shallow: true, only: [:create, :update, :destroy]

    resources :projects, shallow: true do
      resources :user_assignments, shallow: true, only: [:create, :update, :destroy]
    end

    resources :courses, shallow: true do
      resources :user_assignments, shallow: true, only: [:create, :update, :destroy]
    end
  end

  resources :users

  root to: 'fields#index'
end
