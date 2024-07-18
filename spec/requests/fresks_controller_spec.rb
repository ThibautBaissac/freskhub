require "rails_helper"

RSpec.describe "Fresks", type: :request do
  let(:locale) { I18n.default_locale }

  let(:fresk) { create(:fresk) }
  let(:training_session1) { create(:training_session, fresk:) }
  let(:training_session2) { create(:training_session, fresk:) }

  describe "GET /fresks" do
    it "returns a successful response" do
      get fresks_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get fresks_path
      expect(response).to render_template(:index)
    end

    it "loads all fresks into @fresks" do
      fresks = create_list(:fresk, 3)
      get fresks_path

      expected_fresks = fresks.map(&:decorate)
      actual_fresks = assigns(:fresks)

      expect(actual_fresks.map(&:attributes)).to match_array(expected_fresks.map(&:attributes))
    end
  end

  describe "GET /fresks/:id" do
    it "returns a successful response" do
      get fresk_path(fresk, locale:)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get fresk_path(fresk, locale:)
      expect(response).to render_template(:show)
    end

    it "loads the correct fresk into @fresk" do
      get fresk_path(fresk, locale:)
      expect(assigns(:fresk).attributes).to eq(fresk.decorate.attributes)
    end

    # it "loads the correct training sessions into @training_sessions" do
    #   training_session1
    #   training_session2
    #   get fresk_path(fresk)
    #   expect(assigns(:training_sessions)).to match_array([training_session1.decorate, training_session2.decorate])
    # end
  end
end
