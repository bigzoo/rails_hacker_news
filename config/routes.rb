Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts
    resources :comments
  end
  resources :posts do
    resources :comments
  end
  root 'posts#index'
  get "/upvote" => "posts#upvote", :as => :upvote
end
