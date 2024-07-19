require "rails_helper"

RSpec.describe(User, type: :model) do
  describe "associations" do
    it { should belong_to(:country) }
    it { should have_many(:user_languages) }
    it { should have_many(:languages).through(:user_languages) }
  end

  describe "validations" do
    let!(:user) { create(:user) }

    it { should validate_presence_of(:uuid) }
    it { should validate_uniqueness_of(:uuid) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it "validates format of email" do
      should allow_value("user@example.com").for(:email)
      should_not allow_value("userexample.com").for(:email)
      should_not allow_value("user@com").for(:email)
      should_not allow_value("user@.com").for(:email)
    end

    it { should validate_presence_of(:locale) }
    it { should validate_inclusion_of(:locale).in_array(I18n.available_locales.map(&:to_s)) }

    it { should validate_presence_of(:country) }

    it {
      should validate_numericality_of(:latitude).is_greater_than_or_equal_to(-90).is_less_than_or_equal_to(90).allow_nil
    }
    it {
      should validate_numericality_of(:longitude).is_greater_than_or_equal_to(-180).is_less_than_or_equal_to(180).allow_nil
    }
  end

  describe "custom validations" do
    pending "orders by name ascending fails because database in test environment uses the development database"
    # let(:user) { create(:user, last_login_at: Time.now + 1.day) }
    # it "validates that last_login_at is not in the future" do
    #   user.valid?
    #   expect(user.errors[:last_login_at]).to include("can't be in the future")
    # end
  end
end
