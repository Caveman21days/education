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
  patch '/user_answers/:id/accept_user_answer', to: 'user_answers#accept_user_answer'
  patch '/user_answers/:id/reject_user_answer', to: 'user_answers#reject_user_answer'

  resources :users

  get '/notifications', to: 'notifications#index'

  root to: 'fields#index'
end
