Rails.application.routes.draw do
  get "/invites/:id_bet/novo" => "invites#novo", as: "novo_invite"
  get "/invites/inserir" => "invites#inserir", as: "inserir"
  resources :invites
  resources :guesses
  resources :bets
  get "/apostas/nova" => "bets#nova"
  post "/apostas/nova" => "bets#bet_create"
  get "/apostas/inside_bet" => "bets#inside_bet"
  post "/apostas/inside_bet" => "bets#inside_bet"
  get "/bets/" => "bets#inside_bet"
  get "/guesses/nova" => "guesses#nova"
  post "/guesses/nova" => "guesses#guess_create"
  post "/usuarios/login" => "usuarios#login"
  get "/usuarios/cadastro" => "usuarios#cadastro"
  get "/painel" => "welcome#painel"
  get "/usuarios_srch" => "invites#usuarios_srch", as: 'usuarios_srch'
  post "/usuarios/cadastro" => "usuarios#cadastro_create"
  resources :usuarios
  get "/auth/:provider/callback" => "sessions#create", as: :auth_callback
  get "/auth/failure" => "sessions#failure", as: :auth_failure
  get "/logout" => "sessions#destroy", as: :logout
  get 'welcome/index'
  resources :widgets
  get "/apostas/minhas" => "bets#lista"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'
  
  resources :dialogos do
    resources :postagems
end

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
