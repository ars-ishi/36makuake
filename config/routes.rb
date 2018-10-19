Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'
  resources :users do
    resources :orders, only: [:new, :create]
    member do
      get :invest
      get :message
      get :popup
      get :leave
    end
  end

  resources :projects, only: [:index, :new, :create, :show] do
    resources :courses, only: [:new, :create]
  end
end
