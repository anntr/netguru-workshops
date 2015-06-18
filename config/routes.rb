Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, :controllers => {registrations: "registrations"}
  devise_scope :user do
    match '/sign_in', :to => "devise/sessions#new", :via => :get, :as => 'login'
  end

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
end
