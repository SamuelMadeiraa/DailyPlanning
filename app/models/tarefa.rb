class Tarefa < ApplicationRecord
    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :dataehora, presence: true
end
