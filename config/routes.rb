Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :create, :update]
  match '/user_delete', to: 'users#destroy', via: [:delete]
  match 'find_by_email' => "users#find_by_email", via: [:get]
  resources :sessions, only: [:create, :destroy]
  #delete 'users' => 'users#destroy'
  match '/sessions', to: 'sessions#destroy', via: [:delete]
  scope :auth do
    match 'is_admin', to: "auth#is_admin?", via: [:get, :options] 
    match 'is_signed_in', to: "auth#is_signed_in?", via: [:get, :options] 
  end
end
