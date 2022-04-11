FactoryBot.define do
  factory :user do
    # sequence(:name) { |n| "hoge#{n}" }
    # sequence(:email) { |n| "hoge#{n}@example.com" }
    # password { 'password' }
    email                 {"test@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
  end
end
