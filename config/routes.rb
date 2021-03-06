Rails.application.routes.draw do

  get 'refresh_artists' => 'artists#refresh_artists'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :radios, only: [:index, :show]
      resources :artists, only: [:index]
      get 'artists/:artist_name' => 'artists#show', constraints: { artist_name: /[^\/]+/ }
      get 'albums/:artist_name/:song_name' => 'albums#show', constraints: { artist_name: /[^\/]+/, song_name: /[^\/]+/ }
      get 'radios/:id/programs' => 'programs#index'
      get 'radios/:id/active_program' => 'programs#show'
      get 'app_version' => 'base#app_version'
      get 'time' => 'base#time'
      post 'add_to_radio_stats/:artist_name/:song_name/:city/:country/:platform/:ip_address' => 'radios#add_to_radio_stats'
    end

    namespace :v2 do
      resources :radios, only: [:index, :show]
      post 'add_to_radio_stats/:artist_name/:song_name/:city/:country/:platform/:ip_address' => 'radios#add_to_radio_stats'
    end
  end
  
  root to: 'welcome#hastapronto'
  get '*path' => 'welcome#hastapronto'

  get 'admin' => 'admin#index'
  get 'test' => 'test#index'

  devise_for :users, skip: [:session, :password, :registration], controllers: { omniauth_callbacks: "callbacks" }

  scope "(:locale)", locale: /es|en/ do
    #root to: 'welcome#index'
    resources :radios, only: [:show] do
      resources :programs
    end
    resources :musician_forms, only: [:new, :create]
    devise_for :users, skip: [:omniauth_callbacks]
    resources :users, only: [:show] do
      resources :playlists, except: [:index]
    end
    resources :playlists, only: [:index]
    resources :artists do
      get 'stats' => 'admin#index'
      resources :comments, only: [:new, :create, :destroy]
      resources :albums, except: [:index] do      
        resources :comments, only: [:new, :create, :destroy] 
        resources :songs, except: [:index] do
         resources :comments, only: [:new, :create, :destroy] 
        end
      end
    end
    resources :albums, only: [:show] do
      resources :comments, only: [:new, :create, :destroy]
    end
    resources :songs, only: [:show] do
      resources :comments, only: [:new, :create, :destroy]
    end
    resources :playlists, only: [:show] do
      resources :comments, only: [:new, :create, :destroy]
    end
    post 'create_reply' => 'comments#create_reply'
    post 'add_to_playlist' => 'playlists#add_to_playlist'
    post 'remove_from_playlist' => 'playlists#remove_from_playlist'
    post 'add_to_album_stats' => 'albums#add_to_album_stats'
    post 'add_to_song_stats' => 'songs#add_to_song_stats'
    post 'add_to_playlist_stats' => 'playlists#add_to_playlist_stats'
    post 'add_to_radio_stats' => 'radios#add_to_radio_stats'
    post 'add_to_artist_views' => 'artists#add_to_artist_views'
    post 'add_to_album_views' => 'albums#add_to_album_views'
    post 'add_to_song_views' => 'songs#add_to_song_views'
    post 'add_to_playlist_views' => 'playlists#add_to_playlist_views'
    get 'soymusico' => 'musician_forms#new'
    get 'artist_summary' => 'artists#artist_summary'
    get 'album_summary' => 'albums#album_summary'
    get 'sponsorbanner' => 'sponsors#show'
    get 'share_song' => 'radios#share_song'
    get 'program_index' => 'radios#program_index'
    get 'program_sponsor' => 'radios#program_sponsor'
    get 'program_show' => 'radios#program_show'
    get 'sound_offset' => 'albums#sound_offset'
    get 'sound_offset_pl' => 'playlists#sound_offset_pl'
    get 'search_suggestions' => 'search_suggestions#index'
    get 'search_suggestions_artists' => 'search_suggestions#index_artists'
    get 'search_suggestions_albums' => 'search_suggestions#index_albums'
    get 'search_suggestions_songs' => 'search_suggestions#index_songs'
    get 'get_station_artists' => 'artists#index_station'
    get 'get_station_summary' => 'artists#index_station_summary'
    get 'about' => 'about#index'
    get 'elproyecto' => 'about#index'
    get 'test_instagram' => 'test#test_instagram'
    get 'privacy_policy' => 'welcome#privacy_policy'
    # for direct access to artists page and resources, have to be the last lines
    get ':id' => 'artists#show' 
    get ':artist_id/albums/:id' => 'albums#show'
    get ':artist_id/programs/:id' => 'albums#show'
    get ':artist_id/albums/:album_id/songs/:id' => 'songs#show'
    get ':artist_id/programs/:album_id/episode/:id' => 'songs#show'
    get ':artist_id/stats' => 'artists#stats'
  end

  get '/:locale' => 'welcome#index'

end
