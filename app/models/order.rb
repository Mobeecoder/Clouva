class Order < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :ref_number, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :lga, presence: true
  validates :state, presence: true

  belongs_to :user

  has_many :order_details
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true, reject_if: :all_blank
end
