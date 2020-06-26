FactoryBot.define do 
  factory :mission do
    user
    name {Faker::Lorem.word}
    description {Faker::Lorem.word}
    start_at {Faker::Time.backward(days: 3)}
    end_at {Faker::Time.forward(days: 3)}
    priority {Mission.priorities.values.sample}
    status {Mission.statuses.values.sample}
  end
end
