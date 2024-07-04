require "rails_helper"

RSpec.describe Estudo, type: :model do
  context "Atributos necessários para criar novo estudo" do
    it 'Criando novo estudo' do
      estudo = FactoryBot.create(:estudo)
      expect(estudo).to be_valid
    end

    it 'Retorna inválido se estudo não possuir titulo' do
      estudo = FactoryBot.build(:estudo, titulo: nil)
      expect(estudo).not_to be_valid
    end
    it 'Retorna inválido se estudo não possuir descrição' do
      estudo = FactoryBot.build(:estudo, descricao: nil)
      expect(estudo).not_to be_valid
    end
end
end
