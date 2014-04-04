Guo::Application.routes.draw do

  ## Jerry
  ## ======================
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'authentications'
  }

  devise_scope :user do
    get 'users/sign_up/:type' => 'users/registrations#new', as: :sign_up
    post 'signup/send_sms' => 'users/registrations#send_sms'
    post 'signup/validate_captcha' => 'users/registrations#validate_captcha'
  end
  ## =====================

  resource :artist, controller: 'users/artists'


  resources :conversations do
    resources :messages
  end

  #### refactor
  #### New version

  resources :account_statements, controller: 'users/account_statements'
  resources :withdraws, controller: 'users/withdraws' do
    member do
      put :finish
    end
  end
  resource :user_payment_info, only: [ :edit, :update ], controller: 'users/user_payment_infos'

  resources :recharges, controller: 'users/recharges', only: [:index, :new, :create, :show] do
    member do
      post :check_payment
    end
    collection do
      get :done
    end
  end

  resources :addresses
  resources :orders, only: [:index, :show, :update] do
    member do
      put :confirmation
      post :check_payment
      get :detail
    end
    resources :rights, except: :index do
      member do
        post :add_description, :evaluate
      end
    end
  end

  resources :users, only: [ :show ] do
    member do
      get :following, :followers, :favourites, :likes, :galleries
    end
  end

  match 'target/follow'     => 'users#follow',    via: :post, as: :follow_target
  match 'target/unfollow'   => 'users#unfollow',  via: :post, as: :unfollow_target
  match 'target/like'       => 'users#like',      via: :post, as: :like_target
  match 'target/unlike'     => 'users#unlike',    via: :post, as: :unlike_target

  scope :my do
    get 'profile' => 'users#show', as: :my_profile
    get 'status' => 'users#status', as: :my_status
    get 'favourites' => 'users#favourites', as: :my_favourites
    get 'likes' => 'users#likes', as: :my_likes
    get 'galleries' => 'users#galleries', as: :my_galleries

    get 'followers' => 'users#followers', as: :my_followers
    get 'following' => 'users#following', as: :my_following
    get 'rights' => 'rights#index', as: :my_rights
  end

  resources :global_images, only: :create
  resources :payment_passwords

  namespace :sns do
    get 'search' => 'search#misc'
    resources :statuses

    resources :events do
      collection do
        get :my, :overview
      end
      resources :comments, only: :create
    end

    resources :galleries do
      resources :artworks do
        resources :comments, only: :create
      end
    end

    resources :images, only: :index do
      collection do
        post :multi_upload
      end
    end

    resources :groups do

      collection do
        get :explore
        get :refresh_pop
        get :refresh_recommended
      end

      scope 'my' do
        collection do
          get :published_topics, :replied_topics, :overview, :all
        end
      end

      member do
        get :members, :pending_members
      end

      resources :topics

      resources :group_users, only: [:index, :create] do
        collection do
          get :approve, :reject
          delete :cancel
        end
      end
    end

    resources :replies

    get 'guang' => 'home#guang', as: :guang
    get 'explore' => 'explore#index', as: :explore

    root 'home#index'
  end

  resources :recharges

  namespace :weitou do
    resources :auctions, only: :show do
      resources :products, only: :show
    end

    resources :products, only: :show do
      member do
        post :want_bid, :check_bid, :check_payment
        get :not_enough
      end
      resources :bids
    end

    get 'auction/:filter_by_state' => 'auctions#index', as: :auctions
    get 'product(/:filter_by_type)' => 'products#index', as: :products
    # get 'zero' => 'home#zero', as: :zero
    # get 'charity' => 'home#charity', as: :charity

    scope 'my' do
      get 'active_products' => 'profiles#active_products', as: :my_active_products
      get 'closed_products' => 'profiles#closed_products', as: :my_closed_products
      get 'deposits' => 'profiles#deposits', as: :my_deposits
      get 'orders' => 'profiles#orders', as: :my_orders
    end

    root 'home#index'
  end

  namespace :invest do
    root 'home#index'
  end

  namespace :admin do
    resources :daily_items
    resources :collection_items
    resources :global_attribute_catalogs
    resources :topics,:galleries,:events,only:[:new,:index,:edit,:update,:destroy]
    resources :artworks
    resources :withdraws
    resources :weixin_menus do
      collection do
        get :load_default
        get :sync
      end
    end
    resources :groups do
      resources :topics
    end
    resources :galleries do
      resources :artworks
    end
    resources :default_tags do
      collection do
        post :sort
      end
      post :update_name
    end
    resources :auctions
    resources :products
    resources :users do
      member do
        get :account_statements
      end
    end
    resources :rights do
      member do
        post :respond_commit
        get :respond
      end
    end
    resources :pages
    resources :orders, except: [:new, :create] do
      member do
        put :deliver
      end
    end
    resources :categories do
      collection do
        post :sort
      end
      post :update_name
    end
    resources :wiki_categories, except: :new
    resources :wikis
    resources :experts do
      collection do
        post :sort
      end
      post :rename
    end
    resources :global_images, only: :create
    resources :ads
    resources :episodes
    root 'home#index'
  end

  namespace :weixin do
    get '/'  => 'service#verify'
    post '/' => 'service#create', :defaults => { :format => 'xml' }
    resources :daily_items do
      member do
        get 'invitees'
        get 'detail'
      end
    end
    resources :inviters do
      member do
        get 'cut'
      end
    end
    match 'auth/wechat/callback' => 'oauth#callback', via: [:get, :post]
  end

  get '/valid/:attr' => 'validations#valid'

  devise_for :admin_users, controllers: { sessions: 'admin/sessions' }

  get 'alipay_done' => 'alipay#done'
  post 'alipay_notify' => 'alipay#notify'

  root 'home#index'

end
