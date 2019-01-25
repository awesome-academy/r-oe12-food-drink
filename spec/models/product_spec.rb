require "rails_helper"

RSpec.describe Product, type: :model do
  let(:product) {FactoryBot.create :product}
  subject {product}

  describe "associations" do
    it { is_expected.to have_many(:order_details).dependent(:destroy) }
    it { is_expected.to have_many(:ratings).dependent(:destroy) }
    it { is_expected.to belong_to(:category)}
  end

  describe "db schema" do
    context "columns" do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:describe).of_type(:string) }
      it { is_expected.to have_db_column(:quantity).of_type(:integer) }
      it { is_expected.to have_db_column(:picture).of_type(:string) }
      it { is_expected.to have_db_column(:price).of_type(:float) }
      it { is_expected.to have_db_column(:price_new).of_type(:float) }
      it { is_expected.to have_db_column(:category_id).of_type(:integer) }
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(
      Settings.admin.products.name.minimum) }
    it { is_expected.to validate_presence_of(:describe) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).
      is_less_than_or_equal_to(Settings.product.maximum).
      is_greater_than_or_equal_to(Settings.product.minimum) }
  end
end
