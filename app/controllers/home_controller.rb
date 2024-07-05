class HomeController < ApplicationController
    def index
        if params[:pesquisar]
            @compromissos = Compromisso.where(titulo: params[:pesquisar])
        else
            @compromissos = Compromisso.all

        end
    end
end
