BannerLite::Engine.routes.draw do
  resources :banners do
    collection do
      get 'preview'
    end
  end
end
