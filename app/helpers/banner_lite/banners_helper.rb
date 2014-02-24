module BannerLite
  module BannersHelper
    def banners(bnnrs = nil)
      bnnrs ||= Banner.active
      bnnrs.map{|b| banner_html(b) }.join("\n").html_safe
    end

    def banner_html(banner)
      link_to image_tag(banner.src), banner.url
    end
  end
end
