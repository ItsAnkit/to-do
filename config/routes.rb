Rails.application.routes.draw do
  root 'issues#index'
  resources :issues, only: [:index, :create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/update_state', to: 'issues#update_state'
end
