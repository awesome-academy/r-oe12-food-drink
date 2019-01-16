require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryBot.create :user}
  subject {user}

  context "GET #show" do
    it "render show user" do
      get :show, params: {id: user.id}
      expect(response).to render_template "show"
    end
  end
end
