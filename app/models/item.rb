class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to :user

    with_options presence: true do
      validates :text
      validates :name
      validates :image

     with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :day_id
     end
     with_options format: {with: /\A[0-9]+\z/} do
      validates :price, numericality: { 
        greater_than: 300, less_than: 9999999
         }
     end
   end
end