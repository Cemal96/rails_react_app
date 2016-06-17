Rails.application.routes.draw do
  #devise_for :users
  resources :users, only: [:index, :show, :create]
  delete 'users' => 'users#destroy'
  scope :auth do
	  get 'is_signed_in', to: 'auth#is_signed_in?'
	end
end
