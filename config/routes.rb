Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'bills/index'

  get 'bills/add'

	get 'viewall/alumni'

  get 'viewall/students'

  get 'viewall/alumni/paid' => 'viewall#paid'

  get 'viewall/alumni/:year' => 'viewall#year'

  get 'alumni_data/update'

  get 'alumni/index'

  get 'alumni/show'

  get 'student_member/index'

  get 'student_member/show'

  devise_for :coordinators
  devise_for :student_members
  devise_for :registered_alumnis, controllers: { sessions: "registered_alumnis/sessions", registrations: "registered_alumnis/registrations" }

  resources :student_member
  resources :alumni
  resource :alumni_datum
  resource :sponsors

  get 'sponsors/update/:id' => 'sponsors#update'
  get 'sponsors/view/:id' => 'sponsors#view'
  post 'sponsors/edit/:id' => 'sponsors#edit'

  get '/homepage' => 'staticpage#index'
  get '/homepage/studentmember' => 'student_member#index'
  get '/homepage/coordinator' => 'coordinator#index'
  get '/information' => 'registered_alumni#show'

  get '/data/administrator/createallusers' => 'staticpage#createallusers'
  get '/data/administrator/addmorealumni' => 'data#addmore'
  get '/data/administrator/backup' => 'data#backup'

  get 'allotment/allot' => 'allotment#allot'

  post '/alumni/status/search' => 'alumni_status#updatesearch'
  post '/alumni/status/response' => 'alumni_status#updateresponse'



  root 'routing#index'
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
