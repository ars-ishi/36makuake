Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'projects#index'
  resources :users do
    resources :orders, only: [:index, :new, :create]
    member do
      get :edit_password, :invest, :message, :popup, :consumed, :leave
    end
    resources :send_addresses, only: [:index, :new, :edit, :create, :update]
    resources :promoter_profiles, only: [:new, :create, :show, :edit, :update, :show]
    get 'edit_omniauth' => 'users#edit_omniauth'
    patch 'update_omniauth' => 'users#update_omniauth'
  end

  resources :projects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :courses, only: [:new, :create, :show]
    resources :project_comments, only: [:index, :create]
    collection{ get "search" }
    member{get "report"}
  end

  resources :project_likes, only: :index
  post   '/project_like/:project_id' => 'project_likes#like',   as: 'like'
  delete '/project_like/:project_id' => 'project_likes#unlike', as: 'unlike'

  resources :discovers, only: [:index, :new] do
    collection do
      get :soon
      get :pickup
      get :ranking
      get :tags_index
    end
    member do
      get :categories
      get :tags
      get :location
    end
  end
  get 'pages/privacy' => 'pages#privacy'
  get 'pages/term' => 'pages#term'
end
