class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.string      :postal_code,    nill: false
      t.integer     :prefecture_id,  nill: false
      t.string      :city,           nill: false
      t.string      :street,         nill: false
      t.string      :building
      t.string      :phone_number,   nill: false
      t.references  :order,          nill: false, foreign_key: true
      t.timestamps
    end
  end
end
