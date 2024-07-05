FactoryBot.define do
  factory :financeiro do
    titulo { Faker::Lorem.sentence }
    data_vencimento { Faker::Time.between(from: DateTime.now, to: DateTime.now + 30.days) }
    status { [true, false].sample }  # Aleatoriamente verdadeiro ou falso
  end
end
