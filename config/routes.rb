Rails.application.routes.draw do
  get 'angular/character/:id', to: 'angular#character'
  get 'angular/classes'
  get 'angular/levels'
  get 'angular/character_data/:id', to: 'angular#character_data'
  get 'angular/urls'
  get 'angular/skills'
  get 'angular/items'

  resources :spell_materials
  resources :prepared_spells
  resources :known_spells
  resources :favorite_spells
  resources :spell_tags
  resources :tags
  resources :spell_known_progressions
  resources :spell_progressions
  resources :class_spells
  resources :spell_durations
  resources :spell_castings
  resources :spell_ranges
  resources :spells
  resources :magic_schools
  resources :time_increments
  resources :range_types
  resources :subclasses
  resources :inventories
  resources :magics
  resources :armors
  resources :weapons
  resources :damage_types
  resources :items
  resources :item_types
  resources :character_skills
  resources :skills
  resources :character_features
  resources :features
  resources :character_abilities
  resources :class_proficiencies
  resources :characters
  resources :abilities
  resources :level_progressions
  resources :adventuring_classes
  resources :campaigns
  resources :players

  root 'characters#index'

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
