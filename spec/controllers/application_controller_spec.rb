# spec/controllers/application_controller_spec.rb
require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  describe "before_action :authenticate_user!" do
    controller do
      def index
        render plain: "OK"
      end
    end

    context "when user is authenticated" do
      let(:user) { create(:user) }

      before do
        session[:user_id] = user.id
        routes.draw { get "index" => "anonymous#index" }
      end

      it "allows access to the action" do
        get :index
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq("OK")
      end
    end

    context "when user is not authenticated" do
      before do
        routes.draw { get "index" => "anonymous#index" }
      end

      it "redirects to the login page or returns unauthorized status" do
        get :index
        expect(response).to redirect_to(new_auth_session_path)
      end
    end
  end
end
