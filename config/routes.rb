Rails.application.routes.draw do
  resources :consultations, path: 'events'

  get 'healers', to: 'healers#index'
  get 'pages/about', to: 'pages#about'
  get 'pages/calendar', to: 'pages#calendar'
  resources :healers, only: [:show]
  root "pages#homepage"
  resources :ideas
  
  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

  resources :consultations do
      member do
        post 'group_message'
        get 'url_link' 
      end

  #post "consultations/group_message", to: "consultations#group_message"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
