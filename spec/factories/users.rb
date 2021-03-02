FactoryBot.define do
  factory :user do
    nickname              {'test'}
    first_name            {'達矢'}
    name                  {'吉田'}
    first_name_kana       {'タツヤ'}
    name_kana             {'ヨシダ'}
    birth_day             {'2021-02-07'}
    email                 {Faker::Internet.free_email}
    password              {'0yosida'}
    password_confirmation {password}
  end
end