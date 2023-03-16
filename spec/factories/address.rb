FactoryBot.define do
  factory :address, class: Address do
    street { Faker::Address.street_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    postal_code { '70000000' }
  end
end