FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {'儀武'}
    last_name             {'大樹'}
    first_kana            {'ギブ'}
    last_kana             {'タイキ'}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {'1980-03-04'}
  end
end