class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  def add_to_cart
    
    unless session[:cart]
      session[:cart] = {}
    end

    if session[:cart].keys.include?(params[:id])
      flash[:alert] = 'You already have this product in your cart'
    else
      session[:cart][params[:id]] = params[:qty]
      flash[:notice] = 'Product successfully added to cart'
    end

    redirect_to product_path(params[:id])
  end

  def cart
    
  end

  def update_quantity
    session[:cart][params[:id]] = params[:qty]
  end

  def destroy
  end

end
