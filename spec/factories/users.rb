FactoryBot.define do
  factory :user do
    nickname              {'test'}
    first_name            {'吉田'}
    name                  {'吉田'}
    first_name_kana       {'ヨシダ'}
    name_kana             {'ヨシダ'}
    birth_day             {'2021-02-07'}
    email                 {'test@example'}
    password              {'0yosida'}
    password_confirmation {password}
  end
end