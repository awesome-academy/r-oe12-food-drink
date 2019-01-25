require "rails_helper"

RSpec.describe Suggest, type: :model do
  let(:suggest) {FactoryBot.create :suggest}
  subject {suggest}

  describe "associations" do
    it { is_expected.to belong_to(:user)}
  end

  describe "db schema" do
    context "columns" do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:describe).of_type(:string) }
      it { is_expected.to have_db_column(:picture).of_type(:string) }
      it { is_expected.to have_db_column(:price).of_type(:float) }
      it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(
      Settings.suggest.name.minimum) }
    it { is_expected.to validate_presence_of(:describe) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
    it { is_expected.to validate_numericality_of(:price).
      is_less_than_or_equal_to(Settings.suggest.price.maximum).
      is_greater_than_or_equal_to(Settings.suggest.price.minimum) }
  end
end
