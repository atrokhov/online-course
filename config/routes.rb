Rails.application.routes.draw do
	devise_for :user, controllers: { registrations: 'user/registrations' }
	
  resources :categories do
  	resources :courses do
  		resources :lessons
  		patch 'lessons/:id/activate', to: 'lessons#activate', as: 'activate_lesson'
      post 'lessons/:id/add_to_basket', to: 'lessons#add_to_basket', as: 'add_to_basket'
      post 'lessons/:id/buy', to: 'lessons#buy', as: 'buy_lesson'
      delete 'lessons/:id/delete_from_cart', to: 'lessons#delete_from_basket', as: 'delete_from_basket'
  	end

  	patch 'courses/:id/activate', to: 'courses#activate', as: 'activate_course'
  end

  get 'teacher_courses/', to: 'courses#teacher_courses', as: 'teacher_courses'
  get 'cart/', to: 'baskets#index', as: 'cart'
  get 'paid_lessons/', to: 'paid_lessons#index', as: 'paid_lessons'
  get 'checks/', to: 'checks#index', as: 'checks'
  post 'cart/buy_lessons', to: 'baskets#buy', as: 'buy_lessons'
  resources :users, except: [:new, :create]
  patch 'users/:id/block', to: 'users#block', as: 'block_user'
  patch 'users/:id/unblock', to: 'users#unblock', as: 'unblock_user'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
