Rails.application.routes.draw do
	devise_for :user, controllers: { registrations: 'user/registrations' }
	
  resources :categories do
  	resources :courses do
  		resources :lessons
  		patch 'lessons/:id/activate', to: 'lessons#activate', as: 'activate_lesson'
  	end

  	patch 'courses/:id/activate', to: 'courses#activate', as: 'activate_course'
  end

  get 'teacher_courses/', to: 'courses#teacher_courses', as: 'teacher_courses'
  resources :users, except: [:new, :create]
  patch 'users/:id/block', to: 'users#block', as: 'block_user'
  patch 'users/:id/unblock', to: 'users#unblock', as: 'unblock_user'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
