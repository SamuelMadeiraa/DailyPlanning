class TarefasController < ApplicationController
    before_action :set_tarefa, only: [:show, :edit, :update, :destroy]
  
    def index
      @tarefas = Tarefa.all
    end

    def filtrar
      @tarefas = Tarefa.filter_by_tarefa(params[:query])
      render 'filtrar'
    end
  
    def show
    end
  
    def new
      @tarefa = Tarefa.new
    end
  
    def create
      @tarefa = Tarefa.new(tarefa_params)
  
      respond_to do |format|
        if @tarefa.save
          format.html { redirect_to @tarefa, notice: 'tarefa criado com sucesso.' }
          format.json { render :show, status: :created, location: @tarefa }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tarefa.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def edit
    end
  
    def update
      respond_to do |format|
        if @tarefa.update(tarefa_params)
          format.html { redirect_to @tarefa, notice: 'tarefa atualizado com sucesso!' }
          format.json { render :show, status: :ok, location: @tarefa }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @tarefa.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @tarefa.destroy
      respond_to do |format|
        format.html { redirect_to tarefas_url, notice: 'tarefa apagado com sucesso.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end
  
    def tarefa_params
      params.require(:tarefa).permit(:titulo, :descricao, :status, :dataehora)
    end
end
