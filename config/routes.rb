Rails.application.routes.draw do
  root to: 'pages#home'

  # resources :users do
  #     resources :events
  # end
  resources :events, except: [:destroy]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
