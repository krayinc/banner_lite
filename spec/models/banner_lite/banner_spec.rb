require 'spec_helper'

module BannerLite
  describe Banner do
    describe ".active" do
      let!(:inactive1){ BannerLite::Banner.create active_from: 1.month.ago,       active_until: 1.second.ago }
      let!(:active)   { BannerLite::Banner.create active_from: 1.second.ago,      active_until: 5.second.from_now }
      let!(:inactive2){ BannerLite::Banner.create active_from: 5.second.from_now, active_until: 1.month.from_now }

      it "picks active banners" do
        expect(BannerLite::Banner.active).to eq [active]
      end
    end
  end
end
