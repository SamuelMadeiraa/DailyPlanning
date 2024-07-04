class Estudo < ApplicationRecord
    validates :titulo, presence: true
    validates :descricao, presence: true

end
