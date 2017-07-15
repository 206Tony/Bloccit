Rails.application.routes.draw do
  
  # #1 call resources method and pass it a Symbol
  # instructs rails to create post routes for creating, updating, viewing, and deleting instances of Post.
  resources :posts

  # #2 remove get "welcome/index" b/c we've declared index view as root view
  #also mod about route to allow users to visir /about rather than /welcome/about
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
