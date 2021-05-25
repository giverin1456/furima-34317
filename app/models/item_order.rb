class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :prefecture_id
    validates :city
    validates :street
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }, length: { is: 8 }
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { is: 11 }
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Registration.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end