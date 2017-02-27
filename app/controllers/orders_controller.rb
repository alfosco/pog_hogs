class OrdersController < ApplicationController
before_action :current_admin?, only: [:update]

  def index
    @orders = current_user.orders
  end

  def create
    order = current_user.orders.create(status: 0)
    Checkout.new(@cart.contents).place_order(order)
    session.delete(:cart)
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def show
    if current_admin?
      @order = Order.find(params[:id])
    else
      @order = current_user.orders.find(params[:id])
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "Order successfully updated."
      redirect_back(fallback_location: 'admin/dashboard')
    else
      redirect_back(fallback_location: 'admin/dashboard')
    end
  end

  private

  def order_params
    params.permit(:status, :user_id)
  end
end
