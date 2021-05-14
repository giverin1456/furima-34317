FactoryBot.define do
  factory :item do
    name                 {Faker::Name.initials(number:6)}
    text                 {'aaaaaa'}
    category_id          {2}
    status_id            {2}
    delivery_charge_id   {2}
    prefecture_id        {2}
    day_id               {2}
    price                {3000}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
