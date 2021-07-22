class Product < ApplicationRecord
    belongs_to :merchant, class_name: 'User'

    has_many :order_details
    has_many :orders, through: :order_details

    def availability
        num_available.zero? ? "Out Of Stock" : "In Stock"
    end
end
