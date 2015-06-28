Rails.application.routes.draw do

  get 'programs/new'

  get 'programs/edit'

  scope "(:locale)", locale: /es|en/ do
    resources :radios, only: [:show] do
      resources :programs
    end
    devise_for :users
    resources :artists do
      resources :albums, except: [:index] do
        resources :songs, except: [:index]
      end
    end
    get 'artist_summary' => 'artists#artist_summary'
    get 'album_summary' => 'albums#album_summary'
    get 'program_index' => 'radios#program_index'
    get 'program_sponsor' => 'radios#program_sponsor'
    get 'program_show' => 'radios#program_show'
    match '/search_suggestions', to: 'search_suggestions#index', via: :get
    match '/search_suggestions_artists', to: 'search_suggestions#index_artists', via: :get
    match '/search_suggestions_albums', to: 'search_suggestions#index_albums', via: :get
    match '/search_suggestions_songs', to: 'search_suggestions#index_songs', via: :get
  end

  get '/:locale' => 'welcome#index'
  root to: 'welcome#index'


end
