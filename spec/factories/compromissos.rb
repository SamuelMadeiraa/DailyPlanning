FactoryBot.define do
  factory :compromisso do
    titulo { Faker::Lorem.sentence }
    local { Faker::Address.city }
    dataehora { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
