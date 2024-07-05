FactoryBot.define do
  factory :estudo do
    titulo { Faker::Lorem.sentence }
    descricao { Faker::Lorem.paragraph }
  end
end
