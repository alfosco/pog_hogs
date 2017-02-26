require 'rails_helper'

describe "User cannot add a retired item to their cart" do
  scenario "when a user visits an items show page they cannot add it to cart" do
    pogs = Category.create(title: "Pogs")
    item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: pogs, status: 1)

    visit category_item_path(pogs, item)

    expect(page).to have_content("McDonald's Power Ranger Coins")
    expect(page).to have_content("$24.99")
    expect(page).to_not have_button("Add to Cart")
    expect(page).to have_content("Item Retired")

  end
end
