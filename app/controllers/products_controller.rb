class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[add_to_cart]

  def index
    @products = Product.all
  end

  def new
  end

  def create
    product = current_user.products.build(product_params)

    if product.save
      flash[:notice] = ['Product Successfully Uploaded']
    else
      flash[:alert] = ['An Error Occured while uploading. Try Again']
    end
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

  private

  def product_params
    params.require(:product).permit(:name, :size, :image, :description, :num_available, :price)
  end

end
