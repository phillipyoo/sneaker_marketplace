Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'user#index', as:'root'

  #Show list
  get '/sneaker', to: 'sneaker#index', as: 'sneakers'

  #Sell a pair
  get '/sneaker/new', to: 'sneaker#new', as: 'new_sneaker'
  post '/sneaker', to: 'sneaker#sell', as: 'sell_sneaker'

  #Show a pair 
  get '/sneaker/:id', to: 'sneaker#show', as: 'sneaker'

  #Edit profile
  get '/user/edit/:id', to: 'user#edit', as: 'edit_profile'
  patch '/user/edit', to: 'user#update', as: "update_profile"

  #Show user profile
  get '/user/show/:id', to: 'user#show', as: 'user'

  #Show listing
  get '/user/show/:id/listing', to: 'listing#index', as:'listings'

  #Show wishlist
  get '/wishlist', to: 'wishlist#index', as: 'wishlists'

  #Add sneakers to wishlist
  post '/wishlist', to: 'wishlist#add', as: 'add_to_wishlist'
  

end
