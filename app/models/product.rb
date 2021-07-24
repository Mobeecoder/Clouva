class Product < ApplicationRecord
    include ImageUploader::Attachment(:image)

    validates :name, presence: true
    validates :size, presence: true
    validates :image, presence: true
    validates :description, presence: true
    validates :num_available, presence: true
    validates :price, presence: true

    belongs_to :merchant, class_name: 'User'

    has_many :order_details
    has_many :orders, through: :order_details

    def availability
        num_available.zero? ? "Out Of Stock" : "In Stock"
    end
end
