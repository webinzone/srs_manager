Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
	  root 'devise/sessions#new'
	end
  resources :home 
  resources :residents 
  resources :residents_agreements 

  resources :complaints 
  resources :bookings 

  resources :srs_referals 
  resources :profile 

end
