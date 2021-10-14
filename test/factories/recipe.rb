FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    ingredients { rand(2..10).times.map { "#{Faker::Food.measurement} #{Faker::Food.ingredient}" } }
  end
end
