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
  
  #Show user profile
  get '/user/show/:id', to: 'user#show', as: 'user'
  
  #Edit profile
  get '/user/edit/:id', to: 'user#edit', as: 'edit_profile'
  patch '/user/edit', to: 'user#update', as: "update_profile"
  
  #Show listing
  get '/user/show/:id/listing', to: 'listing#index', as:'listings'

  #Remove sneakers from listing
  delete '/sneaker/delete', to: 'listing#destroy', as: "remove_from_listings"

  
  #Show wishlist
  get '/wishlist', to: 'wishlist#index', as: 'wishlists'
  
  #Add sneakers to wishlist
  post '/wishlist', to: 'wishlist#add', as: 'add_to_wishlist'
  
  #Remove sneaker from wishlist
  delete '/sneaker/:id', to: 'wishlist#destroy', as:'remove_from_wishlist'
  
  #Administration
  get '/admin', to: 'admin#index', as: 'administration'
  
  #Block user
  get '/admin/edit/:id', to: 'admin#edit', as: 'edit_user'
  patch '/admin/edit', to: 'admin#update', as: "update_user"

  #Unblock user
  # get '/admin/edit/:id', to: 'admin#adit', as: 'clear_user'
  # patch '/admin/edit', to: 'admin#unblock', as: 'unblock_user'



  #Messages within conversation
  resources :conversations do
    resources :messages
  end
  

end
