Rails.application.routes.draw do

  get 'admin' => 'admin#index'
  get 'test' => 'test#index'

  devise_for :users, skip: [:session, :password, :registration], controllers: { omniauth_callbacks: "callbacks" }

  scope "(:locale)", locale: /es|en/ do
    root to: 'welcome#index'
    resources :radios, only: [:show] do
      resources :programs
    end
    resources :musician_forms, only: [:new, :create]
    devise_for :users, skip: [:omniauth_callbacks]
    resources :playlists
    resources :artists do
      resources :albums, except: [:index] do
        resources :songs, except: [:index]
      end
    end
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
    get 'artists/station/:station_id' => 'artists#index_station'
    get 'about' => 'about#index'
    get 'elproyecto' => 'about#index'
    get 'test_instagram' => 'test#test_instagram'
    # for direct access to artists page and resources, have to be the last lines
    get ':id' => 'artists#show' 
    get ':artist_id/albums/:id' => 'albums#show'
    get ':artist_id/albums/:album_id/songs/:id' => 'songs#show'

  end

  get '/:locale' => 'welcome#index'

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
    end
  end

end
