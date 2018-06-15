Rails.application.routes.draw do
  devise_for :devise

  resources :fields do
    resources :projects, shallow: true

    resources :trainings, shallow: true
  end
end
