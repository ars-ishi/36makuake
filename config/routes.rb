Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'projects#index'
  resources :users, only: [:show, :edit, :update]
  get 'users/:id/edit_omniauth' => 'users#edit_omniauth'
  patch 'users/:id/update_omniauth' => 'users#update_omniauth'
end
