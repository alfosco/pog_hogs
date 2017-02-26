require 'rails_helper'

  describe "a visitor can adjusts the quantity in a cart", type: :feature do
    before(:each) do
      @slammers = Category.create!(title: "Slammers")
      @item_1 = @slammers.items.create!(title: "Lion Holographic Slammer",
                                      price: 3.0,
                                      description: "1/4 thick brass, saw-shaped slammer with holographic lion",
                                      image_path: "http://www.the90swereawesome.com/wp-content/uploads/2014/08/intricate.jpg"
                                      )
    end

      scenario "when a visitor adjusts the quantity in the cart" do
        visit items_path

        click_button "Add to Cart"

        expect(page).to have_content("You now have 1 Lion Holographic Slammer.")

        click_on 'My Cart'

        visit cart_path
    #Then I should see my item with a quantity of 1
          within(".cart_item:nth-child(1)") do
            expect(page).to have_content(1)
          end

    #And when I increase the quantity
        within(".cart_item:nth-child(1)") do
          fill_in('update', :with => 2)
          click_on "Update Quantity"
        end

        expect(current_path).to eq(cart_path)

    #And that item's quantity should reflect the increase
        within(".cart_item:nth-child(1)") do
          expect(page).to have_content("Sub-Total: 6.0")
          expect(page).to have_content(2)
        end

    #And the total for the cart should match that increase
        expect(page).to have_content("Total: 6.0")

    #And when I decrease the quantity
       within(".cart_item:nth-child(1)") do
          fill_in('update', :with => 1)
          click_on "Update Quantity"
        end

    #Then my current page should be '/cart'
        expect(current_path).to eq(cart_path)

    #And that item's quantity should reflect the decrease
        within(".cart_item:nth-child(1)") do
          expect(page).to have_content(1)
        end

        expect(page).to have_content("Total: 3.0")
     end
  end
