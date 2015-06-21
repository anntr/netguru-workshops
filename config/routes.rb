Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: "registrations"}
  devise_scope :user do
    match '/sign_in', :to => "devise/sessions#new", :via => :get, :as => 'login'
  end

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  resources :users
  root 'categories#index'

  Workshops::Application.routes.draw do
    get "*any", via: :all, to: "errors#not_found"
  end
end

