Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :events, except: [:destroy]
  resources :profiles, only: [:new, :edit, :create, :update]

  devise_for :users

  get "about" => "pages#about"
  get "contact" => "pages#contact"
end
