Rails.application.routes.draw do
  
  get 'attendance/section_attendances/:id', to: 'attendance#section_attendances'

  get 'attendance/student_attendances'

  root 'home#sign_in' 

  get 'lecturer/dashboard'

  get 'superadmin/dashboard'

  get 'home/sign_in'

  get 'home/edit'

  post '/home/sign_in_post'

  post '/superadmin/create'

  get '/home/logout'

  get '/superadmin/lecturers'
  get '/superadmin/edit_lecturer/:id', to: 'superadmin#edit_lecturer'
  get '/superadmin/delete_lecturer/:id', to: 'superadmin#delete_lecturer'
  post 'superadmin/update_lecturer'

  get '/lecturer/sections'
  get '/lecturer/new_section'
  get '/lecturer/edit_section'
  get '/lecturer/show_section'
  get 'lecturer/destroy_section'

  post 'lecturer/create_section'
  post 'lecturer/update_section'

  get 'lecturer/new_student'
  post 'lecturer/create_student'
  get 'lecturer/section_students/:id', to: 'lecturer#section_students'
  
  get 'lecturer/edit_student/:id', to: 'lecturer#edit_student'
  post 'lecturer/update_student'
  get 'lecturer/delete_student/:id', to: 'lecturer#delete_student'

  get '/attendance/lecturer_sections'
  post 'attendance/create_attendance'

  get '/attendance/attendance_sheets'
  get '/attendance/attendance_sheets_by_date'

  post '/attendance/search_attendance_sheets'
  post '/attendance/search_attendance_sheets_by_date'

  get '/attendance/show_attendance_sheets'
  get '/attendance/show_attendance_sheets_by_date'


  get '/attendance/download_sheet'

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
