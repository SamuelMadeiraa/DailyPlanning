require 'rails_helper'

RSpec.describe EstudosController, type: :controller do
  let!(:estudo) { create(:estudo) }

  describe "GET #index" do
    it "returns 200 success" do
      
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
  it "returns 200 success" do
    get :show, params: { id: estudo.id }
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
      it "creates a new estudo" do
        expect {
          post :create, params: { estudo: attributes_for(:estudo) }
        }.to change(Estudo, :count).by(1)
      end

      it "redirects to the created estudo" do
        post :create, params: { estudo: attributes_for(:estudo) }
        expect(response).to redirect_to(Estudo.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new estudo" do
        expect {
          post :create, params: { estudo: attributes_for(:estudo, titulo: nil) }
        }.to_not change(Estudo, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { estudo: attributes_for(:estudo, titulo: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
  describe "DELETE #destroy" do
    it "deletes the estudo" do
      expect {
        delete :destroy, params: { id: estudo.id }
      }.to change(Estudo, :count).by(-1)
    end

    it "redirects to estudos#index" do
      delete :destroy, params: { id: estudo.id }
      expect(response).to redirect_to(estudos_path)
    end
  end


end
