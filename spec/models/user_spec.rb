require "rails_helper"

RSpec.describe User, :type => :model do
  let(:user) {FactoryBot.create :user}
  subject {user}

  describe "db schema" do
    context "columns" do
      it { is_expected.to have_db_column(:email).of_type(:string) }
      it { is_expected.to have_db_column(:username).of_type(:string) }
      it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
      it { is_expected.to have_db_column(:address).of_type(:string) }
      it { is_expected.to have_db_column(:phone).of_type(:string) }
      it { is_expected.to have_db_column(:is_admin).of_type(:boolean) }
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:suggests).dependent(:destroy) }
    it { is_expected.to have_many(:orders).dependent(:destroy) }
    it { is_expected.to have_many(:ratings).dependent(:destroy) }
  end

end
