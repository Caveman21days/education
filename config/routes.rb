Rails.application.routes.draw do
  devise_for :users


  resources :users
  resources :courses do

    resources :projects do
      resources :tasks
    end

    resources :trainings, shallow: true
  end
end
