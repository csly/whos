Rails.application.routes.draw do

root to: 'articles#index'

resources :articles 
resources :authors
resources :author_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'author_sessions#new'
get 'logout' => 'author_sessions#destroy'

get 'tagged' => 'articles#tagged', :as => 'tagged'  
get 'featured' => 'articles#featured', :as => 'featured'   

end
