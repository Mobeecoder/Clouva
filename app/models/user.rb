class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :is_merchant, -> { where(merchant: true) }

  has_many :products, foreign_key: 'merchant_id'
  has_many :orders
end
