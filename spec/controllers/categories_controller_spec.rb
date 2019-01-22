require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:user) {FactoryBot.create :user, :admin}
  before {sign_in user}
  let(:category) {FactoryBot.create :category}
  subject {category}

  let(:category_invalid) do
    {
      name: ""
    }
  end

  describe "GET #new" do
    it "assigns a blank category to the view" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create,
        params: {category: FactoryBot.attributes_for(:category)}}
      it "creates a new category" do
        expect(assigns(:category)).to be_a Category
      end

      it "redirects after create" do
        expect(flash[:success]).to match(I18n.t("flash.create_success"))
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    context "invalid params" do
      before {post :create, params: {category: category_invalid}}
      it "create fail" do
        expect(flash[:danger]).to match(I18n.t("flash.create_fail"))
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: subject.id}}
    context "success" do
      it "test message" do
        expect(flash[:success]).to match(I18n.t("flash.delete_success"))
        expect(response).to redirect_to(admin_categories_path)
      end
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: subject.id, category:{name: "food"}}
        expect(flash[:success]).to match(I18n.t("flash.update_success"))
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    context "update category" do
      it "update fail" do
        patch :update, params: {id: subject.id, category:{name: ""}}
        expect(flash[:danger]).to match(I18n.t("flash.update_fail"))
        expect(response).to render_template :edit
      end
    end
  end
end
