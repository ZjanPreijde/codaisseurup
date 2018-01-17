Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  # resources :users do
  #     resources :events
  # end
  resources :events, except: [:destroy]

  devise_for :users


  # resources :events do
  #   resources :registrations, only: [:create]
  # end
end
