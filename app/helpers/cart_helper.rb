module CartHelper
    def cart_total
    #   Multiply each item price by it's selected quantity and put them in an array.
    #   Then add all the prices in that array
      cart_details.map{|item| item.price * session[:cart][item.id.to_s].to_i}.inject(:+)
    end
end