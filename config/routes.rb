Store::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    root 'store#index', as: 'store'

    get "pages/about"

    get "pages/tos"

    get "pages/faq"

    get "pages/privacy_policy"

    resources :store

    resources :customers

    resources :images, :only => [:new, :create, :update, :destroy]

    resources :traits

    resources :collaborators

    resources :users

    resources :orders

    resources :line_items

    resources :carts

    resources :products do
          resources :images
    end

    resources :collaborators

    resources :password_resets
  
    controller :customer_sessions do
      get 'customer_login' => :new
      post 'customer_login' => :create
      delete 'customer_logout' => :destroy
    end

    match '/edit_card', to: 'customers#edit_card', via: 'get'
  
    match '/update_card', to: 'customers#update_card', via: 'post'

    match '/charge_order', to: 'orders#charge_order', via: 'get'
  end
  
  match '*path', via: :all, to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  
  match '', via: :all, to: redirect("/#{I18n.default_locale}")
end
