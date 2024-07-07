class CategoriumController < ApplicationController
    before_action :set_categorium, only: [:show, :edit, :update, :destroy]

    def index
        @categorium = Categorium.all
    end

    def show
    end

    def new
        @categorium = Categorium.new
    end

    def create
        @categorium = Categorium.new(categorium_params)

        respond_to do |format|
            if @categorium.save
                format.html { redirect_to @categorium, notice: "Categoria criado com sucesso!" }
                format.json { render :show, status: :created, location: @categorium }
            else
                format.html { render :new }
                format.json { render json: @categorium.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @categorium.update(categorium_params)
                format.html { redirect_to @categorium, notice: "Categoria atualizado com sucesso!" }
                format.json { render :show, status: :ok, location: @categorium }
            else
                format.html { render :edit }
                format.json { render json: @categorium.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @categorium.destroy
        respond_to do |format|
            format.html { redirect_to categoriums_url, notice: 'Categoria apagado com sucesso.' }
            format.json { head :no_content }
        end
    end

    private

    def set_categorium
        @categorium = Categorium.find(params[:id])
    end

    def categorium_params
        params.require(:categorium).permit(:titulo)
    end
end
