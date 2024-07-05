require "rails_helper"

RSpec.describe Language, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:set1_code) }
    it { should validate_presence_of(:set2_code) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:set1_code) }
    it { should validate_uniqueness_of(:set2_code) }
  end

  describe "associations" do
    it { should have_many(:users) }
  end

  describe "default scope" do
    pending "orders by name ascending"
    #   let!(:language2) { create(:language, name: "Language 1", alpha2_code: "C1", alpha3_code: "CU1") }
    #   let!(:language1) { create(:language, name: "Language 2", alpha2_code: "C2", alpha3_code: "CU2") }

    #   it "orders by name ascending" do
    #     expect(language.all).to eq([language2, language1])
    #   end
  end
end
