class CompromissosController < ApplicationController
    before_action :set_compromisso, only: [:show, :edit, :update, :destroy]
    def index
      @compromissos = Compromisso.all
      
      if params[:query].present?
        @compromissos = @compromissos.where('titulo LIKE ?', "%#{params[:query]}%")
      end
  
      if params[:status].present?
        if params[:status] == 'concluidos'
          @compromissos = @compromissos.where(status: true)
        elsif params[:status] == 'nao_concluidos'
          @compromissos = @compromissos.where(status: false)
        end
      end
  
      if params[:start_date].present? && params[:end_date].present?
        start_date = DateTime.parse(params[:start_date])
        end_date = DateTime.parse(params[:end_date])
        @compromissos = @compromissos.where(dataehora: start_date..end_date)
      elsif params[:start_date].present?
        start_date = DateTime.parse(params[:start_date])
        @compromissos = @compromissos.where('dataehora >= ?', start_date)
      elsif params[:end_date].present?
        end_date = DateTime.parse(params[:end_date])
        @compromissos = @compromissos.where('dataehora <= ?', end_date)
      end
    end

      def concluidos
        @compromissos = Compromisso.where(status: true)
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
      @compromisso = Compromisso.find(params[:id])
      
      respond_to do |format|
        if @compromisso.update(compromisso_params.merge(status: true))
          format.html { redirect_to compromissos_path, notice: 'Compromisso atualizado e concluído com sucesso!' }
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

  