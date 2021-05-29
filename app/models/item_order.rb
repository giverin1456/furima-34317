class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :city
    validates :street
    validates :item_id
    validates :user_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }, length: { is: 8 }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { maximum: 11 }
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Registration.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end