require_dependency "banner_lite/application_controller"

module BannerLite
  class ImageBannersController < ApplicationController
    before_action :set_banner, only: [:show, :edit, :update, :destroy]

    def index
      @banners = ImageBanner.all
    end

    def show
    end

    def new
      @banner = ImageBanner.new
    end

    def edit
    end

    def create
      @banner = ImageBanner.new(banner_params)

      if @banner.save
        redirect_to @banner, notice: 'ImageBanner was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @banner.update(banner_params)
        redirect_to @banner, notice: 'ImageBanner was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @banner.destroy
      redirect_to image_banners_url, notice: 'ImageBanner was successfully destroyed.'
    end

    private
      def set_banner
        @banner = ImageBanner.find(params[:id])
      end

      def banner_params
        params.require(:image_banner).permit(:url, :file, :active_from, :active_until)
      end
  end
end
