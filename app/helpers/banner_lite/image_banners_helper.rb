module BannerLite
  module ImageBannersHelper
    def image_banners(bnnrs = nil)
      bnnrs ||= ImageBanner.active
      bnnrs.map{|b| banner_html(b) }.join("\n").html_safe
    end

    def banner_html(banner)
      link_to image_tag(banner.src), banner.url
    end
  end
end
