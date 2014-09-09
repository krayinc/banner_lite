FactoryGirl.define do
  factory :text_banner, class: BannerLite::TextBanner do
    url 'http://example.com'
    banner_text 'Visit our brand-new site!'
    active_from '2014-01-05 06:00:00'
    active_until '2014-02-25 21:00:00'
  end
end