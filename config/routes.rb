Rails.application.routes.draw do

  scope "(:locale)", locale: /es|en/ do
    resources :radios, only: [:show]
    devise_for :users
    resources :artists do
      resources :albums, except: [:index] do
        resources :songs, except: [:index]
      end
    end
    get 'artist_summary' => 'artists#artist_summary'
    get 'album_summary' => 'albums#album_summary'
  end

  get '/:locale' => 'welcome#index'
  root to: 'welcome#index'


end
