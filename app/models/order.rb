class Order < ApplicationRecord
  belongs_to :user

  validates :order_number, :order_details, :total, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
end
