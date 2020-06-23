FactoryBot.define do 
  factory :mission do
    name {Faker::Lorem.word}
    description {Faker::Lorem.word}
    start_at {Faker::Time.backward(days: 3)}
    end_at {Faker::Time.forward(days: 3)}
    status {1}
    priority {1}
  end
end
