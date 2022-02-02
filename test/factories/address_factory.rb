FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
# START:edit:3
    zip { Faker::Address.zip }
# END:edit:3
  end
end
