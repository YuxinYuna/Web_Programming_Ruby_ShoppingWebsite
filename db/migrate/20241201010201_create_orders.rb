class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_number
      t.json :order_details
      t.decimal :total, precision: 10, scale: 2
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
