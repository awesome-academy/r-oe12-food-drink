require "rails_helper"

RSpec.describe Admin::SuggestsController, type: :controller do
  let(:user) {FactoryBot.create :user, :admin}
  before {sign_in user}
  let(:suggest) {FactoryBot.create :suggest}
  subject {suggest}

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: subject.id}}
    context "success" do
      it "test message" do
        expect(flash[:success]).to match(I18n.t("flash.delete_success"))
        expect(response).to redirect_to(admin_suggests_path)
      end
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: subject.id, suggest:{status: "1"}}
        expect(response).to redirect_to(admin_suggests_path)
      end
    end

    context "update suggest" do
      it "update fail" do
        patch :update, params: {id: subject.id, suggest:{status: "3"}}
        expect(response).to redirect_to(admin_suggests_path)
      end
    end
  end

  describe SuggestsController do
    let(:user) {FactoryBot.create :user, :user}
    before {sign_in user}

    let(:suggest_invalid) do
      {
        name: "",
        describe: "",
        price: "",
        category_id: ""
      }
    end

    describe "GET #new" do
      it "assigns a blank suggest to the view" do
        get :new
        expect(assigns(:suggest)).to be_a_new(Suggest)
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        before {post :create,
          params: {suggest: FactoryBot.attributes_for(:suggest)}}
        it "creates a new suggest" do
          expect(assigns(:suggest)).to be_a Suggest
        end
      end

      context "invalid params" do
        before {post :create, params: {suggest: suggest_invalid}}
        it "create fail" do
          expect(flash[:danger]).to match(I18n.t("flash.suggested_fail"))
          expect(response).to render_template :new
        end
      end
    end
  end
end
