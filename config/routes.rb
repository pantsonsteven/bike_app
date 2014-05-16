Rails.application.routes.draw do

  root 'welcome#index'
  
  resources :locations do
  end

  resources :users do 
    resources :trips do 
    end
  end  
end
