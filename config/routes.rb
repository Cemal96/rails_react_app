Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :create, :destroy, :update]
  match 'find_by_email' => "users#find_by_email", via: [:get]
  resources :sessions, only: [:create, :destroy]
  #delete 'users' => 'users#destroy'
  match '/sessions', to: 'sessions#destroy', via: [:delete]
  scope :auth do
	  match 'is_admin' => "auth#is_admin?", via: [:get, :options] 
	  match 'is_signed_in' => "auth#is_signed_in?", via: [:get, :options] 
	end
end
