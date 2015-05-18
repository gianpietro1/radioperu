Rails.application.routes.draw do

  get 'songs/show'

  get 'songs/new'

  get 'songs/edit'

  scope "(:locale)", locale: /es|en/ do
    resources :radios, only: [:show]
    devise_for :users
    resources :artists do
      resources :albums, except: [:index] do
        resources :songs, except: [:index]
      end
    end
  end

  get '/:locale' => 'welcome#index'
  root to: 'welcome#index'

end
