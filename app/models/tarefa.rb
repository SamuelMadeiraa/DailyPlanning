class Tarefa < ApplicationRecord
    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :dataehora, presence: true

    scope :filter_by_tarefa, -> (query) { where("titulo LIKE ?", "%#{query}%") }

end
