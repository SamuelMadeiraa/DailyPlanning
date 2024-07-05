class FinanceiroController < ApplicationController
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
  
      respond_to do |format|
        if @estudo.save
          format.html { redirect_to @estudo, notice: 'estudo criado com sucesso.' }
          format.json { render :show, status: :created, location: @estudo }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @estudo.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def edit
    end
  
    def update
      respond_to do |format|
        if @estudo.update(estudo_params)
          format.html { redirect_to @estudo, notice: 'estudo atualizado com sucesso!' }
          format.json { render :show, status: :ok, location: @estudo }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @estudo.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @estudo.destroy
      respond_to do |format|
        format.html { redirect_to estudos_url, notice: 'estudo apagado com sucesso.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_estudo
      @estudo = Estudo.find(params[:id])
    end
  
    def estudo_params
      params.require(:estudo).permit(:titulo, :descricao)
    end
end
