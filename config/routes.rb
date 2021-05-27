Rails.application.routes.draw do
	devise_for :user, controllers: { registrations: 'user/registrations' }
  resources :categories
  resources :courses
  resources :users, except: [:new, :create]
  patch 'users/:id/block', to: 'users#block', as: 'block_user'
  patch 'users/:id/unblock', to: 'users#unblock', as: 'unblock_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
