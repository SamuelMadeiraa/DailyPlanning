class Financeiro < ApplicationRecord
    validates :titulo, presence: true
    validates :data_vencimento, presence: true

    has_many :Categorium
    has_many :financeiro

end
