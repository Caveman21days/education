Rails.application.routes.draw do
  devise_for :users


  resources :users
  resources :courses do

    resources :projects, shallow: true do
      resources :issue
    end

    resources :trainings, shallow: true
  end
end
