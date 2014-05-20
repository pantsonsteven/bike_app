Rails.application.routes.draw do

  root 'users#index'

  resources :users do 
    resources :trips do 
    end
  end  

  get 'session/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: 'log_out'

  get 'profiles' => 'profiles#index'
  get 'profiles/edit' => 'profiles#edit', as: 'edit_profiles'

end
