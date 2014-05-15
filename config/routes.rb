Rails.application.routes.draw do

  root 'users#index'

  resources :users do 
    resources :trips
  end
  
end
