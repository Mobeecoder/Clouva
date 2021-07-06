class Product < ApplicationRecord
    belongs_to :merchant, class_name: 'User'
end
