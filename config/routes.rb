SociaLoginRails::Application.routes.draw do



  get "home/index"
  resources :tips
  root :to => "homes#show", via: :get

  
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  match 'tagged', to: 'tips#index', :as => 'tagged', via: 'get'
  match 'tags/:tag', to: 'tips#index', as:  :tag , via: 'get'
  # match 'tags', to: 'tags#index', as:  :tip_type , via: 'get'
  get "pages/terms"
  get "pages/welcome"
  get "pages/tags"
  match '/tags', to: 'pages#tags', via: 'get'
  match '/conditions', to: 'pages#conditions', via: 'get'
  match '/symptoms', to: 'pages#symptoms', via: 'get'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :users do
    post 'follow' => 'following_relationships#create'
    delete 'follow' => 'following_relationships#destroy'
  end
  get :my_tips, to: 'tips#my_tips', as: 'my_tips'
  resource :dashboard, only: [:show]

  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]


# reputation system


resources :tips do
  member { post :vote }
end


# --------------------------
  # resources :sessions, only: [:new, :create, :destroy]
  
  # match '/signup',  to: 'users#new',            via: 'get'
  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'

 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
