require 'rails_helper'

  describe "a visitor can adjusts the quantity in a cart", type: :feature do
    before(:each) do
      @category = Category.create!(title: "Slammers")
      @item_1 = @category.items.create!(title: "Lion Holographic Slammer",
                                      price: 3.0,
                                      description: "1/4 thick brass, saw-shaped slammer with holographic lion",
                                      image_path: "http://www.the90swereawesome.com/wp-content/uploads/2014/08/intricate.jpg"
                                      )
    end

      scenario "when a visitor adjusts the quantity in the cart" do

        cart = Cart.new({@item_1.id => 1})
        #   Background: My cart has an item in it
        #   As a visitor
        #   When I visit "/cart"

        visit cart_path
        #spiking out the logic
        #Then I should see my item with a quantity of 1
        within(".cart_item div:nth-child(1)") do
          expect(item_quantity).to equal(1)
        end

        find.all()


    #     #   And when I increase the quantity
    #     fill_in first_item quantity with (2)

    #     #   Then my current page should be '/cart'
    #     expect(current_path).to eq(cart_path)

    #     #   And that item's quantity should reflect the increase
    #     within(:div, "cart_item nth:child(1)") do
    #       #expect(item_quantity).to equal(2)
    #     end

    # #   And the subtotal for that item should increase
    #       within(:div, "cart_item nth:child(1)") do
    #       #expect(sub_total).to equal("sub_total")
    #       end

    # #   And the total for the cart should match that increase
    #     expect(page).to have_content("total")

    # #   And when I decrease the quantity
    #     fill_in #first_item quantity with 1

    # #   Then my current page should be '/cart'
    #     expect(current_path).to eq(cart_path)

    # #   And that item's quantity should reflect the decrease
    #       within(:div, "cart_item nth:child(1)") do
    #       #expect(item_quantity).to equal(1)
    #       end
     end
  end
