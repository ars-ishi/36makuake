Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'projects#index'
  resources :users do
    resources :orders, only: [:new, :create]
    member do
      get :edit_password
      get :invest
      get :message
      get :popup
      get :consumed
      get :leave
    end
    get 'edit_omniauth' => 'users#edit_omniauth'
    patch 'update_omniauth' => 'users#update_omniauth'
  end

  resources :projects, only: [:index, :new, :create, :show] do
    resources :courses, only: [:new, :create, :show]
    collection{ get "search" }
  end
end
