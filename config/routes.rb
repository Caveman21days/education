Rails.application.routes.draw do
  devise_for :users

  resources :fields do
    resources :user_assignments, shallow: true

    resources :projects, shallow: true do
      resources :user_assignments, shallow: true
      resources :issues, shallow: true, except: [:index] do
        resources :user_assignments, shallow: true
        resources :user_answers, shallow: true, only: [:create, :update, :destroy]
      end
    end

    resources :courses, shallow: true do
      resources :user_assignments, shallow: true
      resources :issues, shallow: true, except: [:index] do
        resources :user_assignments, shallow: true
        resources :user_answers, shallow: true, only: [:create, :update, :destroy]
      end
    end
  end

  resources :users

  root to: 'fields#index'
end
