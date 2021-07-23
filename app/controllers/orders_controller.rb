class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    params[:order][:ref_number] = rand_num
    p params
  end

  def show
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

end
