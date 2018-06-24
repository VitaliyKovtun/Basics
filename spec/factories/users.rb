FactoryBot.define do
  factory :user do
    email { 'email@email.com' }
    password { 'Password12345678' }
    password_confirmation { password }
    confirmed_at Time.now
    confirmation_sent_at Time.now
  end
end
