require 'spec_helper'

module BannerLite
  describe TextBanner do
    describe ".banner_text" do
      it "should be invalid without banner_text" do
        banner = BannerLite::TextBanner.new({
          url: 'http://www.google.com',
          text: ''
        })
        expect(banner).to be_invalid
      end
    end
  end
end
