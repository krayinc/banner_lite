class AddBannerTextToBannerLiteBanners < ActiveRecord::Migration
  def up
    add_column :banner_lite_banners, :text, :string
    add_column :banner_lite_banners, :type, :string

    ::BannerLite::Banner.update_all(type: 'BannerLite::ImageBanner')
  end

  def down
    remove_column :banner_lite_banners, :text
    remove_column :banner_lite_banners, :type
  end
end
