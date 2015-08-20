Rails.application.routes.draw do

  scope "(:locale)", locale: /es|en/ do
    resources :radios, only: [:show] do
      resources :programs
    end
    resources :musician_forms, only: [:new, :create]
    devise_for :users
    resources :artists do
      resources :albums, except: [:index] do
        resources :songs, except: [:index]
      end
    end
    get 'artist_summary' => 'artists#artist_summary'
    get 'album_summary' => 'albums#album_summary'
    get 'share_song' => 'radios#share_song'
    get 'program_index' => 'radios#program_index'
    get 'program_sponsor' => 'radios#program_sponsor'
    get 'program_show' => 'radios#program_show'
    get 'sound_offset' => 'albums#sound_offset'
    get '/search_suggestions' => 'search_suggestions#index'
    get '/search_suggestions_artists' => 'search_suggestions#index_artists'
    get '/search_suggestions_albums' => 'search_suggestions#index_albums'
    get '/search_suggestions_songs' => 'search_suggestions#index_songs'
    get 'artists/station/:station_id' => 'artists#index_station'
    get 'about' => 'about#index'
  end

  get '/:locale' => 'welcome#index'
  root to: 'welcome#index'

end
