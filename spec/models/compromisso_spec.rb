require "rails_helper"

RSpec.describe Compromisso, type: :model do
  context "Atributos necessários para criar novo compromisso" do
    it 'Criando novo(a) compromisso(a)' do
      compromisso = FactoryBot.create(:compromisso)
      expect(compromisso).to be_valid
    end

    it 'Retorna inválido se compromisso não possuir titulo' do
      compromisso = FactoryBot.build(:compromisso, titulo: nil)
      expect(compromisso).not_to be_valid
    end
end
end
