class Compromisso < ApplicationRecord
    validates :titulo, presence: true
    validates :local, presence: true
    validates :dataehora, presence: true
end
