require "rails_helper"
require "support/base_request_helper"

RSpec.describe Administration::ComponentsController, type: :request do
  include BaseRequestHelper

  let(:user) { create(:user) }

  describe "GET /index" do
    before do
      sign_in_as(user)
    end

    it "returns a successful response" do
      get(administration_components_path)
      expect(response).to have_http_status(:success)
    end
  end
end
