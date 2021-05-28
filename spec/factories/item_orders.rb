FactoryBot.define do
  factory :item_order do
    token            {"sk_test_f11111111bb1234567891024"}
    prefecture_id    {2}
    city             {"大阪市"}
    street           {"1丁目"}
    postal_code      {"123-4567"}
    phone_number     {"09012345678"}
    building         {'abcビル'}
  end
end