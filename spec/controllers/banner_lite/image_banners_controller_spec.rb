require 'spec_helper'

module BannerLite
  describe ImageBannersController do
    routes { BannerLite::Engine.routes }

    let(:valid_attributes) { {
      "url" => "MyString",
      "file" => Rack::Test::UploadedFile.new(File.expand_path('../../../fixtures/files/dummy.png', __FILE__), 'image/jpeg'),
    } }
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all banners as @banners" do
        banner = ImageBanner.create! valid_attributes
        get :index, {}, valid_session
        assigns(:banners).should eq([banner])
      end
    end

    describe "GET show" do
      it "assigns the requested banner as @banner" do
        banner = ImageBanner.create! valid_attributes
        get :show, {:id => banner.to_param}, valid_session
        assigns(:banner).should eq(banner)
      end
    end

    describe "GET new" do
      it "assigns a new banner as @banner" do
        get :new, {}, valid_session
        assigns(:banner).should be_a_new(ImageBanner)
      end
    end

    describe "GET edit" do
      it "assigns the requested banner as @banner" do
        banner = ImageBanner.create! valid_attributes
        get :edit, {:id => banner.to_param}, valid_session
        assigns(:banner).should eq(banner)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new ImageBanner" do
          expect {
            post :create, {:image_banner => valid_attributes}, valid_session
          }.to change(ImageBanner, :count).by(1)
        end

        it "assigns a newly created banner as @banner" do
          post :create, {:image_banner => valid_attributes}, valid_session
          assigns(:banner).should be_a(ImageBanner)
          assigns(:banner).should be_persisted
        end

        it "redirects to the created banner" do
          post :create, {:image_banner => valid_attributes}, valid_session
          response.should redirect_to(ImageBanner.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved banner as @banner" do
          # Trigger the behavior that occurs when invalid params are submitted
          ImageBanner.any_instance.stub(:save).and_return(false)
          post :create, {:image_banner => { "url" => "invalid value" }}, valid_session
          assigns(:banner).should be_a_new(ImageBanner)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          ImageBanner.any_instance.stub(:save).and_return(false)
          post :create, {:image_banner => { "url" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested banner" do
          banner = ImageBanner.create! valid_attributes
          # Assuming there are no other banners in the database, this
          # specifies that the ImageBanner created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          ImageBanner.any_instance.should_receive(:update).with({ "url" => "MyString" })
          put :update, {:id => banner.to_param, :image_banner => { "url" => "MyString" }}, valid_session
        end

        it "assigns the requested banner as @banner" do
          banner = ImageBanner.create! valid_attributes
          put :update, {:id => banner.to_param, :image_banner => valid_attributes}, valid_session
          assigns(:banner).should eq(banner)
        end

        it "redirects to the banner" do
          banner = ImageBanner.create! valid_attributes
          put :update, {:id => banner.to_param, :image_banner => valid_attributes}, valid_session
          response.should redirect_to(banner)
        end
      end

      describe "with invalid params" do
        it "assigns the banner as @banner" do
          banner = ImageBanner.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          ImageBanner.any_instance.stub(:save).and_return(false)
          put :update, {:id => banner.to_param, :image_banner => { "url" => "invalid value" }}, valid_session
          assigns(:banner).should eq(banner)
        end

        it "re-renders the 'edit' template" do
          banner = ImageBanner.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          ImageBanner.any_instance.stub(:save).and_return(false)
          put :update, {:id => banner.to_param, :image_banner => { "url" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested banner" do
        banner = ImageBanner.create! valid_attributes
        expect {
          delete :destroy, {:id => banner.to_param}, valid_session
        }.to change(ImageBanner, :count).by(-1)
      end

      it "redirects to the banners list" do
        banner = ImageBanner.create! valid_attributes
        delete :destroy, {:id => banner.to_param}, valid_session
        response.should redirect_to(image_banners_url)
      end
    end

  end
end
