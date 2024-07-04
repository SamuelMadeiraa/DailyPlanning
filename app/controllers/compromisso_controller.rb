class CompromissoController < ApplicationController
    def index
        @compromissos = Compromisso.all
    end
end
