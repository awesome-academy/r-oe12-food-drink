require "rails_helper"

RSpec.describe Admin::ProductsController, type: :controller do
  let(:user) {FactoryBot.create :user, :admin}
  before {sign_in user}
  let(:product) {FactoryBot.create :product}
  subject {product}

  let(:product_invalid) do
    {
      name: "",
      describe: "",
      quantity: "",
      price: "",
      category_id: ""
    }
  end

  describe "GET #new" do
    it "assigns a blank product to the view" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create,
        params: {product: FactoryBot.attributes_for(:product)}}
      it "creates a new product" do
        expect(assigns(:product)).to be_a Product
      end
    end

    context "invalid params" do
      before {post :create, params: {product: product_invalid}}
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
        expect(response).to redirect_to(admin_products_path)
      end
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: subject.id, product:{name: "banh bao"}}
        expect(flash[:success]).to match(I18n.t("flash.update_success"))
        expect(response).to redirect_to(admin_products_path)
      end
    end

    context "update product" do
      it "update fail" do
        patch :update, params: {id: subject.id, product:{name: ""}}
        expect(flash[:danger]).to match(I18n.t("flash.update_fail"))
        expect(response).to render_template :edit
      end
    end
  end
end
