Rails.application.routes.draw do

  resources :people
#  resources :invoices
#  resources :clients
  resources :contacts

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'clients#index'

  resources :clients do
#    member do
#      get :invoices
#    end
    resources :invoices
  end

 # resources :clients do
 #   resources :client_contacts, path: :contacts
 #end

#  scope 'clients/:client_id' do
#    resources :client_contacts, path: :contacts
#  end

  # Routes to contact information of a client:

#  get 'clients/:id/contacts/' => 'clients#client_contacts'
#  get 'clients/:id/contacts/:client_contact_id/edit' => 'clients#edit_client_contact'
#  post 'clients/:id/contacts/:client_contact_id' => 'clients#update_client_contact'
#  delete 'clients/:id/contacts/:client_contact_id' => 'clients#destroy_client_contact'

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
