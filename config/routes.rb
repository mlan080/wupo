Rails.application.routes.draw do
  get 'healers', to: 'healers#index'
  get 'pages/about', to: 'pages#about'
  resources :healers
  root "pages#homepage"
  resources :ideas

  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
