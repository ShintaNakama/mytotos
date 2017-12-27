Rails.application.routes.draw do
  devise_for :users
  root 'pages#index' 
  get 'pages/show' =>  'pages#show'
  get 'pages/index' => 'pages#index'

  get 'forecasts/show/:id' => 'forecasts#show'
  post 'forecasts/input' => 'forecasts#input'
  get 'forecasts/compare' => 'forecasts#compare'
  
  post 'points/dividend' => 'points#dividend'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
