require 'rails_helper'

  describe "When a user adds items to cart", type: :feature do
    before(:each) do
      category = Category.create!(title: "Slammers")
      item_1 = category.items.create!(title: "Lion Holographic Slammer",
                                      price: 3.29,
                                      description: "1/4 thick brass, saw-shaped slammer with holographic lion",
                                      image_path: "http://www.the90swereawesome.com/wp-content/uploads/2014/08/intricate.jpg"
                                      )
    end
      scenario "they see a message is displayed and items are in cart" do
        visit items_path
        click_button "Add to Cart"

        expect(page).to have_content("You now have 1 Lion Holographic Slammer.")

        click_on 'My Cart'

        expect(page).to have_content "Item: Lion Holographic Slammer"
        expect(page).to have_content "Quantity: 1"
        within("div.subtotal") do
          expect(page).to have_content "Subtotal: $3.29"
        end
    end
  end
