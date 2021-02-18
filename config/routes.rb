Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  get '/commercial'    => 'pages#commercial'
  get "/home"         => 'pages#index'
  get '/error'        => 'pages#error'
  get '/quotes'        =>  'quotes#quotes'
  get '/residential'  => 'pages#residential'
  # get '/charts'       => 'pages#charts'
  # get '/diagram'      => 'pages#diagram'

  # post '/leads'       => 'leads#create'
  post "/quotes"      => "quotes#create"
   
  devise_scope :user do 
    get "/signup" => "devise/registrations#new" 
    get "/signin" => "devise/sessions#new" 
  end

  Rails.application.routes.draw do
    resources :quotes, only: [:new, :create]
  end
end