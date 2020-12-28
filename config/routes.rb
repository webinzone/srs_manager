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

    end
   
  end 
  resources :residents 
  resources :residents_agreements 
  resources :support_plans 
  resources :transfer_forms
  resources :complaints 
  resources :bookings 
  resources :incidents 

  resources :srs_referals 
  resources :profile 

end
