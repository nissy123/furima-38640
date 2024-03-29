FactoryBot.define do
  factory :user do
    nickname              {"furima太郎"}
    email                 {Faker::Internet.free_email}
    password              {"123aaa"}
    password_confirmation    {password}
    last_name           {"山田"}
    last_name_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birthday             {"2000-01-01"}
  end
end
