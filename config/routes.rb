BannerLite::Engine.routes.draw do
  resources :image_banners do
    collection do
      get 'preview'
    end
  end
end
