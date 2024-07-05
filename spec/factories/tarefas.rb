FactoryBot.define do
  factory :tarefa do
    titulo { Faker::Lorem.sentence }
    descricao { Faker::Lorem.paragraph }
    status { [true, false].sample }  # Aleatoriamente verdadeiro ou falso
    dataehora { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
