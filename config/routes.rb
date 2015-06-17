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
  end

  get '/:locale' => 'welcome#index'
  root to: 'welcome#index'


end
