Rails.application.routes.draw do
	devise_for :user, controllers: { registrations: 'user/registrations' }
  resources :categories
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
