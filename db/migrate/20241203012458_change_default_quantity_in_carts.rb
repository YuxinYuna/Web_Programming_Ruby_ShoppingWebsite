class ChangeDefaultQuantityInCarts < ActiveRecord::Migration[8.0]
  def change
    change_column_default :carts, :quantity, from: 1, to: 0
  end
end
