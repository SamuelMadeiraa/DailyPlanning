class Financeiro < ApplicationRecord
    validates :titulo, presence: true
    validates :data_vencimento, presence: true

end
