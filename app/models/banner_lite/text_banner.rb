module BannerLite
  class TextBanner < Banner
    validates :banner_text, presence: true
  end
end
