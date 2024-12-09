class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /(?=.*[A-Z])(?=.*\d)(?=.*[\W_])/, message: 'must contain at least one uppercase letter, one number, and one special character.' }, confirmation: true
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  def admin?
    self.admin
  end
end
