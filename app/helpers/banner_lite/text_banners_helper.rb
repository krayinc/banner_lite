module BannerLite
  module TextBannersHelper
    def text_banners(bnnrs = nil)
      bnnrs ||= TextBanner.active
      bnnrs.map{|b| banner_html(b) }.join("\n").html_safe
    end

    def banner_html(banner)
      link_to banner.banner_text, banner.url
    end
  end
end
