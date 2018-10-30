Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'projects#index'
  resources :users do
    resources :orders, only: [:new, :create]
    member do
      get :edit_password, :invest, :message, :popup, :consumed, :leave
    end
    resources :promoter_profiles, only: [:new, :create, :show, :edit, :update, :show]
    get 'edit_omniauth' => 'users#edit_omniauth'
    patch 'update_omniauth' => 'users#update_omniauth'
  end

  resources :projects, only: [:index, :new, :create, :show] do
    resources :courses, only: [:new, :create, :show]
    resources :project_comments, only: [:index, :create]
    collection{ get "search" }
  end

  resources :discovers, only: [:index, :new] do
    collection do
      get :soon
      get :pickup
      get :ranking
    end
    member do
      get :categories
    end
  end
  get 'pages/privacy' => 'pages#privacy'
  get 'pages/term' => 'pages#term'
end
