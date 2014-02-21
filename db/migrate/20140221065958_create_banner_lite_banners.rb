class CreateBannerLiteBanners < ActiveRecord::Migration
  def change
    create_table :banner_lite_banners do |t|
      t.string :url
      t.string :file_name
      t.datetime :active_from
      t.datetime :active_until
    end
  end
end
