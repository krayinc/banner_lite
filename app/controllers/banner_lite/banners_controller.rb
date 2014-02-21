require_dependency "banner_lite/application_controller"

module BannerLite
  class BannersController < ApplicationController
    before_action :set_banner, only: [:show, :edit, :update, :destroy]

    def index
      @banners = Banner.all
    end

    def show
    end

    def new
      @banner = Banner.new
    end

    def edit
    end

    def create
      @banner = Banner.new(banner_params)

      if @banner.save
        redirect_to @banner, notice: 'Banner was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @banner.update(banner_params)
        redirect_to @banner, notice: 'Banner was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @banner.destroy
      redirect_to banners_url, notice: 'Banner was successfully destroyed.'
    end

    private
      def set_banner
        @banner = Banner.find(params[:id])
      end

      def banner_params
        params.require(:banner).permit(:url, :file_name, :active_from, :active_until)
      end
  end
end
