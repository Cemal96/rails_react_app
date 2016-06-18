Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :create, :destroy]
  resources :sessions, only: [:create, :destroy]
  #delete 'users' => 'users#destroy'
  match '/sessions', to: 'sessions#destroy', via: [:delete]
  scope :auth do
	  # get 'is_signed_in', to: 'auth#is_signed_in?'
	  match 'is_signed_in' => "auth#is_signed_in?", via: [:get, :options] 
	end
end
