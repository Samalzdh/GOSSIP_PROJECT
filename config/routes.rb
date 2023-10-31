Rails.application.routes.draw do

  root to: 'public#index'
  get '/contact' , to: 'public#contact'
  get '/team' , to: 'public#team'
  get '/welcome' , to: 'public#welcome'
  get '/user'  , to: 'user#show', as: 'user'
  
  # get '/gossips', to: 'gossips#index'
  # get '/gossips/:id' ,to: 'gossips#show' , as: 'gossip'

  resources :gossips
  


  # get 'New%gossip' , to: 'gossip#newgossip'
  # get '/patients'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
