require 'spec_helper'

feature 'banner management' do
  given(:image_path){ Rails.root + 'spec/fixtures/files/image.png' }

  scenario 'create and show banners' do
    visit '/banner_lite/banners/new'
    fill_in 'Url', with: 'http://rubyonrails.org'
    attach_file 'File', image_path
    click_on 'Create Banner'

    visit BannerLite::Banner.last.src
    expect(page.body).to eq File.read(image_path, mode: 'rb')

    visit '/banner_lite/banners'
    click_on 'Destroy'
  end
end
