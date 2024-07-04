class Compromisso < ApplicationRecord
    validates :titulo, presence: true
    validates :local, presence: true
    validates :dataehora, presence: true

    validates :dataehora, uniqueness: { case_sensitive: false, on: :create, message: "Não foi possível adicionar compromisso, pois já existe um compromisso nesse dia e hora." }

end
