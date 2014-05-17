Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do 
    resources :trips do 
    end
  end  
end
