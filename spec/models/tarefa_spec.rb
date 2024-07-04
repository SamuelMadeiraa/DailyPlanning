require "rails_helper"

RSpec.describe Tarefa, type: :model do
  context "Atributos necessários para criar novo tarefa" do
    it 'Criando nova tarefa' do
      tarefa = FactoryBot.create(:tarefa)
      expect(tarefa).to be_valid
    end

    it 'Retorna inválido se tarefa não possuir titulo' do
      tarefa = FactoryBot.build(:tarefa, titulo: nil)
      expect(tarefa).not_to be_valid
    end
    it 'Retorna inválido se tarefa não possuir descricao' do
      tarefa = FactoryBot.build(:tarefa, descricao: nil)
      expect(tarefa).not_to be_valid
    end
    it 'Retorna inválido se tarefa não possuir data e hora' do
      tarefa = FactoryBot.build(:tarefa, dataehora: nil)
      expect(tarefa).not_to be_valid
    end
end
end
