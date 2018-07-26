Rails.application.routes.draw do
  devise_for :users

  resources :fields do
    resources :user_assignments, shallow: true

    resources :projects, shallow: true do
      resources :user_assignments, shallow: true
      resources :issues, shallow: true,except: [:index] do
        get 'user_issues_list', to: 'issues#user_issues_list'
        resources :user_assignments, shallow: true
        resources :user_answers, shallow: true, only: [:create, :update, :destroy]
      end
      resources :user_applications, only: [:new, :create, :show, :destroy] do
        delete '/accept', to: 'user_applications#accept', as: :accept
        delete '/reject', to: 'user_applications#reject', as: :reject
      end
    end

    resources :courses, shallow: true do
      resources :user_assignments, shallow: true
      resources :issues, shallow: true, except: [:index] do
        resources :user_assignments, shallow: true
        resources :user_answers, shallow: true, only: [:create, :update, :destroy]
      end
      resources :user_applications, only: [:new, :create, :show, :destroy] do

      end
    end
  end

  patch '/user_answers/:id/accept_user_answer', to: 'user_answers#accept_user_answer'
  patch '/user_answers/:id/reject_user_answer', to: 'user_answers#reject_user_answer'

  get '/notifications', to: 'notifications#index'

  resources :users
  resources :search

  post 'search/projects/', to: 'search#search_projects'

  resources :topics do
    resources :answers, only: [:create, :update, :destroy], shallow: true
  end


  root to: 'fields#index'
end
