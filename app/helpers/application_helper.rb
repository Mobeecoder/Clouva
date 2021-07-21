module ApplicationHelper
    def cart_details
        product_ids = session[:cart].nil? ? nil : session[:cart].keys
        cart_items = Product.where(id: product_ids).all
    end
end
