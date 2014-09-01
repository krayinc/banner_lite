FactoryGirl.define do
  factory :banner, class: BannerLite::ImageBanner do
    url 'http://example.com'
    file Rack::Test::UploadedFile.new(File.expand_path('../../fixtures/files/dummy.png', __FILE__), 'image/jpeg')
    active_from '2014-01-05 06:00:00'
    active_until '2014-02-25 21:00:00'
  end
end
