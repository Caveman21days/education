Rails.application.routes.draw do
  devise_for :users

  resources :main_fields do
    resources :fields, shallow: true do
      resources :user_assignments, shallow: true

      resources :projects, shallow: true do
        resources :wikis, shallow: true

        resources :user_assignments, shallow: true
        resources :issues, shallow: true,except: [:index] do
          get 'user_issues_list', to: 'issues#user_issues_list'
          resources :user_assignments, shallow: true
          resources :user_answers, shallow: true, only: [:create, :update, :destroy]
        end
        resources :role_applications, only: [:new, :create, :show, :destroy] do
          patch '/accept', to: 'role_applications#accept', as: :accept
          patch '/reject', to: 'role_applications#reject', as: :reject
        end
      end
      

      resources :courses, shallow: true do
        resources :wikis, shallow: true
        resources :user_assignments, shallow: true
        resources :issues, shallow: true, except: [:index] do
          resources :user_assignments, shallow: true
          resources :user_answers, shallow: true, only: [:create, :update, :destroy]
        end
        resources :role_applications, only: [:new, :create, :show, :destroy] do
        end
      end

      resources :creation_applications, only: [:new, :create] do
      
      end
    end
  end

  resources :creation_applications, only: [:show, :destroy] do
    patch '/accept', to: 'creation_applications#accept', as: :accept
    patch '/reject', to: 'creation_applications#reject', as: :reject
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

  resources :attachments, only: [:destroy]

  get '/notifications', to: 'notifications#index'

###########
  resources :advanced_abilities, only: [:create]
###########

  root to: 'main_fields#index'
end
