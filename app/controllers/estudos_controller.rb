class EstudosController < ApplicationController
    before_action :set_estudo, only: [:show, :edit, :update, :destroy]
  
    def index
      @estudos = Estudo.all
    end
  
    def show
    end
  
    def new
      @estudo = Estudo.new
    end
  
    def create
      @estudo = Estudo.new(estudo_params)
      if @estudo.save
        redirect_to @estudo, notice: 'Estudo foi criado com sucesso.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @estudo.update(estudo_params)
        redirect_to @estudo, notice: 'Estudo foi atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @estudo.destroy
      redirect_to estudos_url, notice: 'Estudo foi excluído com sucesso.'
    end
  
    private
  
    def set_estudo
      @estudo = Estudo.find(params[:id])
    end
  
    def estudo_params
      params.require(:estudo).permit(:titulo, :descricao)
    end
  end
  