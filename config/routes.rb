BannerLite::Engine.routes.draw do
  resources :image_banners do
    collection do
      get 'preview'
    end
  end
  resources :text_banners do
    collection do
      get 'preview'
    end
  end
end
