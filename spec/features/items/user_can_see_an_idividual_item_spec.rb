require 'rails_helper'

describe "User can see individual item" do
  scenario "when they click on the item they are taken to the item show page" do
    pogs = Category.create(title: "Pogs")
    item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: pogs)

      visit category_item_path(pogs, item)

      expect(page).to have_content("McDonald's Power Ranger Coins")
      expect(page).to have_content("$24.99")
      expect(page).to have_button("Add to Cart")

  end
end
