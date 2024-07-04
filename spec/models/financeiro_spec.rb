require "rails_helper"

RSpec.describe Financeiro, type: :model do
  context "Atributos necessários para criar novo financeiro" do
    it "Gerando novo registro financeiro" do
      financeiro = FactoryBot.create(:financeiro)
      expect(financeiro).to be_valid
    end

    it 'Retorna inválido se financeiro não possuir titulo' do
      financeiro = FactoryBot.build(:financeiro, titulo: nil)
      expect(financeiro).not_to be_valid
    end
    it 'Retorna inválido se financeiro não possuir data vencimento' do
      financeiro = FactoryBot.build(:financeiro, data_vencimento: nil)
      expect(financeiro).not_to be_valid
    end
end
end
