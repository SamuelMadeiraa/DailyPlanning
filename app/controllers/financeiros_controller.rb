class FinanceirosController < ApplicationController
    before_action :set_financeiro, only: [:show, :edit, :update, :destroy]
  
    # GET /financeiros
    def index
      @financeiros = Financeiro.all
    end
  
    # GET /financeiros/1
    def show
    end
  
    # GET /financeiros/new
    def new
      @financeiro = Financeiro.new
    end
  
    # GET /financeiros/1/edit
    def edit
    end
  
    # POST /financeiros
    def create
      @financeiro = Financeiro.new(financeiro_params)
  
      if @financeiro.save
        redirect_to @financeiro, notice: 'Financeiro was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /financeiros/1
    def update
      if @financeiro.update(financeiro_params)
        redirect_to @financeiro, notice: 'Financeiro was successfully updated.'
      else
        render :edit
      end
    end

    def pago
      @financeiro = Financeiro.find(params[:id])
      
      if @financeiro.update(status: true)
        redirect_to financeiros_path, notice: 'Conta paga com sucesso.'
      else
        redirect_to financeiros_path, alert: 'Não foi possível concluir o pagamento.'
      end
    end
  
    # DELETE /financeiros/1
    def destroy
      @financeiro.destroy
      redirect_to financeiros_url, notice: 'Financeiro was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_financeiro
        @financeiro = Financeiro.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def financeiro_params
        params.require(:financeiro).permit(:titulo, :data_paga, :data_vencimento, :status)
      end
  end
  