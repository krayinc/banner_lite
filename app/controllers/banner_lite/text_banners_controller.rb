require_dependency "banner_lite/application_controller"

module BannerLite
  class TextBannersController < ApplicationController
    before_action :set_text_banner, only: [:show, :edit, :update, :destroy]

    def index
      @text_banners = TextBanner.all
    end

    def show
    end

    def new
      @text_banner = TextBanner.new
    end

    def edit
    end

    def create
      @text_banner = TextBanner.new(text_banner_params)

      if @text_banner.save
        redirect_to @text_banner, notice: 'Text banner was successfully created.'
      else
        render :new
      end
    end

    def update
      if @text_banner.update(text_banner_params)
        redirect_to @text_banner, notice: 'Text banner was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @text_banner.destroy
      redirect_to text_banners_url, notice: 'Text banner was successfully destroyed.'
    end

    private
      def set_text_banner
        @text_banner = TextBanner.find(params[:id])
      end

      def text_banner_params
        params.require(:text_banner).permit(:url, :active_from, :active_until, :banner_text)
      end
  end
end
