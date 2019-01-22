require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category) {FactoryBot.create :category}
  subject {category}

  describe "associations" do
    it { is_expected.to have_many(:products).dependent(:destroy) }
  end

  describe "db schema" do
    context "columns" do
      it { is_expected.to have_db_column(:name).of_type(:string) }
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(
      Settings.category.name.maxium) }
  end
end
