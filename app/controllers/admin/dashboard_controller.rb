class Admin::DashboardController < Admin::BaseController

  def dashboard
    @orders = Order.all
    render :admin_dashboard
  end

end
