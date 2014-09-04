require 'spec_helper'

module BannerLite
  describe TextBannersController do
    routes { BannerLite::Engine.routes }

    let(:valid_attributes) { {
      url:'http://www.google.co.jp',
      text: 'Visit our special site!',
    } }

    let(:invalid_attributes) { {
      url: '',
      text: '',
    } }
    let(:valid_session) { { } }

    describe "GET index" do
      it "assigns all text_banners as @text_banners" do
        text_banner = TextBanner.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:text_banners)).to eq([text_banner])
      end
    end

    describe "GET show" do
      it "assigns the requested text_banner as @text_banner" do
        text_banner = TextBanner.create! valid_attributes
        get :show, {:id => text_banner.to_param}, valid_session
        expect(assigns(:text_banner)).to eq(text_banner)
      end
    end

    describe "GET new" do
      it "assigns a new text_banner as @text_banner" do
        get :new, {}, valid_session
        expect(assigns(:text_banner)).to be_a_new(TextBanner)
      end
    end

    describe "GET edit" do
      it "assigns the requested text_banner as @text_banner" do
        text_banner = TextBanner.create! valid_attributes
        get :edit, {:id => text_banner.to_param}, valid_session
        expect(assigns(:text_banner)).to eq(text_banner)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new TextBanner" do
          expect {
            post :create, {:text_banner => valid_attributes}, valid_session
          }.to change(TextBanner, :count).by(1)
        end

        it "assigns a newly created text_banner as @text_banner" do
          post :create, {:text_banner => valid_attributes}, valid_session
          expect(assigns(:text_banner)).to be_a(TextBanner)
          expect(assigns(:text_banner)).to be_persisted
        end

        it "redirects to the created text_banner" do
          post :create, {:text_banner => valid_attributes}, valid_session
          expect(response).to redirect_to(TextBanner.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved text_banner as @text_banner" do
          post :create, {:text_banner => invalid_attributes}, valid_session
          expect(assigns(:text_banner)).to be_a_new(TextBanner)
        end

        it "re-renders the 'new' template" do
          post :create, {:text_banner => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) { {
          url: 'http://www.google.co.jp'
        } }

        it "updates the requested text_banner" do
          text_banner = TextBanner.create! valid_attributes
          put :update, {:id => text_banner.to_param, :text_banner => new_attributes}, valid_session
          text_banner.reload
        end

        it "assigns the requested text_banner as @text_banner" do
          text_banner = TextBanner.create! valid_attributes
          put :update, {:id => text_banner.to_param, :text_banner => valid_attributes}, valid_session
          expect(assigns(:text_banner)).to eq(text_banner)
        end

        it "redirects to the text_banner" do
          text_banner = TextBanner.create! valid_attributes
          put :update, {:id => text_banner.to_param, :text_banner => valid_attributes}, valid_session
          expect(response).to redirect_to(text_banner)
        end
      end

      describe "with invalid params" do
        it "assigns the text_banner as @text_banner" do
          text_banner = TextBanner.create! valid_attributes
          put :update, {:id => text_banner.to_param, :text_banner => invalid_attributes}, valid_session
          expect(assigns(:text_banner)).to eq(text_banner)
        end

        it "re-renders the 'edit' template" do
          text_banner = TextBanner.create! valid_attributes
          put :update, {:id => text_banner.to_param, :text_banner => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested text_banner" do
        text_banner = TextBanner.create! valid_attributes
        expect {
          delete :destroy, {:id => text_banner.to_param}, valid_session
        }.to change(TextBanner, :count).by(-1)
      end

      it "redirects to the text_banners list" do
        text_banner = TextBanner.create! valid_attributes
        delete :destroy, {:id => text_banner.to_param}, valid_session
        expect(response).to redirect_to(text_banners_url)
      end
    end

  end
end
