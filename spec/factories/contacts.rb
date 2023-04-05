FactoryBot.define do
  factory :contact do
    user
    name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    credit_card_number { Faker::Finance.credit_card }
    email { Faker::Internet.email }
    credit_card_network { "Visa" }
    credit_card_last_four { "1234" }
  end
end
