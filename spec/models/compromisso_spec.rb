require "rails_helper"

RSpec.describe Compromisso, type: :model do
  context "Atributos necessários para criar novo compromisso" do
    it 'Criando novo compromisso' do
      compromisso = FactoryBot.create(:compromisso)
      expect(compromisso).to be_valid
    end

    it 'Retorna inválido se compromisso não possuir titulo' do
      compromisso = FactoryBot.build(:compromisso, titulo: nil)
      expect(compromisso).not_to be_valid
    end
    it 'Retorna inválido se compromisso não possuir local' do
      compromisso = FactoryBot.build(:compromisso, local: nil)
      expect(compromisso).not_to be_valid
    end
    it 'Retorna inválido se compromisso não possuir data e hora' do
      compromisso = FactoryBot.build(:compromisso, dataehora: nil)
      expect(compromisso).not_to be_valid
    end
end
end
