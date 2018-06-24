FactoryBot.define do
  factory :profile do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    gender { FFaker::Internet.domain_word }
    language { FFaker::Internet.domain_suffix }
    country { FFaker::Address.country }
    birth_date { Date.today - 33.years }
    admin { false }
    association :user
  end
end
