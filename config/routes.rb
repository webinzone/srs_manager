Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
	  root 'devise/sessions#new'
	end
  resources :home do
    collection do
      get :menu
      get :users
      put 'update/:id/', to: 'home#update'
      get :invoice
    end
   
  end 
  resources :residents 
  resources :residents_agreements 
  resources :support_plans 
  resources :complaints 
  resources :bookings 
  resources :incident_reports 
  resources :srs_referals 
  resources :profile 
  resources :transfer_details 


end
