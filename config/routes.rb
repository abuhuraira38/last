Rails.application.routes.draw do
  resources :widgets, only: [ :show, :index, :new, :create ]
  resources :widget_ratings, only: [ :create ]


  namespace :customer_service do
    resources :widgets, only: [ :show, :update, :destroy ]
  end

  if Rails.env.development?
    resources :design_system_docs, only: [ :index ]
  end

  # All API endpoints should go in this namespace.
  # If you need a custom route to an API endpoint,
  # add it in the custom routes section, but make
  # sure the resource-based route is here.
  namespace :api do
# START:edit:3
    namespace :v1 do
      resources :widgets, only: [ :show ]
    end
# END:edit:3
  end

  ####
  # Custom routes start here
  #
  # For each new custom route:
  #
  # * Be sure you have the canonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard

  # Used in podcast ads for the 'amazing' campaign
  get "/amazing", to: "widgets#index"

end
