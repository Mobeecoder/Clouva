class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    order = current_user.orders.build(order_params)

    if order.save
      order.save_details(helpers.cart_details, session[:cart])
      redirect_to '/confirmation/' + order.ref_number.to_s
    else
      flash[:alert] = order.errors.full_messages
      redirect_to '/checkout'
    end

  end

  def show
    @order = Order.find_by(ref_number: params[:ref])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def rand_num
    num = rand(111111...999999)
    while Order.exists?(ref_number: num)
      num = rand(111111...999999)
    end

    num
  end

  def order_params
    params[:order][:ref_number] = rand_num
    params.require(:order).permit(:first_name, :last_name, :phone, :email, :address, :lga, :state, :ref_number)
  end

end
