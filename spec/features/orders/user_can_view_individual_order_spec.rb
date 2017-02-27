require 'rails_helper'

RSpec.feature "User can see individual order" do
  scenario "from their dashboard page" do
    pogs = Category.create(title: "Pogs")
    item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: pogs)
    user = User.create(
                       first_name: "John",
                       last_name: "Doe",
                       email: "johndoe@gmail.com",
                       password: "password"
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    order = Order.create(user_id: user.id)
    order_item = OrderItem.create(quantity: 2, item_id: item.id, order_id: order.id)

    visit '/dashboard'
    click_on "My Orders"
    expect(page).to have_content("Order History")
    click_on "Order Details"
    expect(page).to have_content("Status: Ordered")
    expect(page).to have_content("Order Total: $24.99")
  end

  xscenario "but not other users orders" do
    pogs = Category.create(title: "Pogs")
    item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: pogs)
    user_1 = User.create(
                       first_name: "John",
                       last_name: "Doe",
                       email: "johndoe@gmail.com",
                       password: "password"
                       )
    user_2 = User.create(
                        first_name: "Samuel",
                        last_name: "McKeen",
                        email: "SamMcKeen@gmail.com",
                        password: "password",
                        )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)
    order = Order.create(user_id: user_1.id)
    order_item = OrderItem.create(quantity: 2, item_id: item.id, order_id: order.id)

    visit '/orders/1'
    expect(page).to have_content("404")
  end
end
