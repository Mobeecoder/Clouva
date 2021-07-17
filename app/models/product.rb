class Product < ApplicationRecord
    belongs_to :merchant, class_name: 'User'

    def availability
        num_available.zero? ? "Out Of Stock" : "In Stock"
    end
end
