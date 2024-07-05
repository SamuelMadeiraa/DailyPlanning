require 'rails_helper'

RSpec.describe TarefasController, type: :controller do
  let!(:tarefa) { create(:tarefa) }

  describe "GET #index" do
    it "returns 200 success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    describe "GET #show" do
    it "returns 200 success" do
      get :show, params: { id: tarefa.id }
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
  end
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new tarefa" do
        expect {
          post :create, params: { tarefa: attributes_for(:tarefa) }
        }.to change(Tarefa, :count).by(1)
      end

      it "redirects to the created tarefa" do
        post :create, params: { tarefa: attributes_for(:tarefa) }
        expect(response).to redirect_to(Tarefa.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new tarefa" do
        expect {
          post :create, params: { tarefa: attributes_for(:tarefa, titulo: nil) }
        }.to_not change(Tarefa, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { tarefa: attributes_for(:tarefa, titulo: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
  describe "DELETE #destroy" do
    it "deletes the tarefa" do
      expect {
        delete :destroy, params: { id: tarefa.id }
      }.to change(Tarefa, :count).by(-1)
    end

    it "redirects to tarefas#index" do
      delete :destroy, params: { id: tarefa.id }
      expect(response).to redirect_to(tarefas_path)
    end
  end

 

  
end
