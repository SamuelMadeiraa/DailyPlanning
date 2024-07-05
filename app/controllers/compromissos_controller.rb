class CompromissosController < ApplicationController
    before_action :set_compromisso, only: [:show, :edit, :update, :destroy]
  
    def index
      @compromissos = Compromisso.all
    end
    
    def show
    end
  
    def new
      @compromisso = Compromisso.new
    end
  
    def create
      @compromisso = Compromisso.new(compromisso_params)
  
      respond_to do |format|
        if @compromisso.save
          format.html { redirect_to @compromisso, notice: 'Compromisso criado com sucesso.' }
          format.json { render :show, status: :created, location: @compromisso }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @compromisso.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def edit
    end
  
    def update
      respond_to do |format|
        if @compromisso.update(compromisso_params)
          format.html { redirect_to @compromisso, notice: 'Compromisso atualizado com sucesso!' }
          format.json { render :show, status: :ok, location: @compromisso }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @compromisso.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @compromisso.destroy
      respond_to do |format|
        format.html { redirect_to compromissos_url, notice: 'Compromisso apagado com sucesso.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_compromisso
      @compromisso = Compromisso.find(params[:id])
    end
  
    def compromisso_params
      params.require(:compromisso).permit(:titulo, :local, :dataehora)
    end
  end
  