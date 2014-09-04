module BannerLite
  class TextBanner < Banner
    validates :text, presence: true
  end
end
