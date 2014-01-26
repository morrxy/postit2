PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, except: :destroy do
    member do
      post :vote
    end

    # GET /posts/archives

    # collection do
    #   get :archives
    # end

    resources :comments, only: [:create] do
      member do
        post :vote
      end
    end

  end

  resources :categories, only: [:new, :create, :show]

  resources :users, only: [:create, :show] do
    member do
      get :edit
    end
  end
end

# resources :votes, only: [:create]
# POST /votes => 'VotesController#create'
#   - needs two pieces of infomation

# POST /posts/3/vote => 'PostsController#vote'
# POST /comments/4/vote => 'CommentsController#vote'
