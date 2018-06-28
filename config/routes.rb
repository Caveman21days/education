Rails.application.routes.draw do

  root 'courses#index'
  devise_for :users

<<<<<<< HEAD
  resources :fields do
    resources :user_assignments, shallow: true

    resources :projects, shallow: true do
      resources :user_assignments, shallow: true
      resources :issues, shallow: true, except: [:index] do
        resources :user_assignments, shallow: true
      end
    end

    resources :courses, shallow: true do
      resources :user_assignments, shallow: true
      resources :issues, shallow: true, except: [:index] do
        resources :user_assignments, shallow: true
      end
=======
  resources :courses do
    resources :projects do
      resources :tasks
>>>>>>> c13ea4d0bf9df0463ee5f82d01255b642fb86b51
    end
  end

  resources :users
  
  root to: 'fields#index'
end
