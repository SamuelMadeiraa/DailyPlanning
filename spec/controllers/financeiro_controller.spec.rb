require 'rails_helper'

RSpec.describe FinanceirosController, type: :controller do
  let!(:financeiro) { create(:financeiro) }

  describe "GET #index" do
    it "returns 200 success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns 200 success" do
      get :show, params: { id: financeiro.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns 200 success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new financeiro" do
        expect {
          post :create, params: { financeiro: attributes_for(:financeiro) }
        }.to change(Financeiro, :count).by(1)
      end

      it "redirects to the created financeiro" do
        post :create, params: { financeiro: attributes_for(:financeiro) }
        expect(response).to redirect_to(Financeiro.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new financeiro" do
        expect {
          post :create, params: { financeiro: attributes_for(:financeiro, titulo: nil) }
        }.to_not change(Financeiro, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { financeiro: attributes_for(:financeiro, titulo: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the financeiro" do
      expect {
        delete :destroy, params: { id: financeiro.id }
      }.to change(Financeiro, :count).by(-1)
    end

    it "redirects to financeiros#index" do
      delete :destroy, params: { id: financeiro.id }
      expect(response).to redirect_to(financeiros_path)
    end
  end
end