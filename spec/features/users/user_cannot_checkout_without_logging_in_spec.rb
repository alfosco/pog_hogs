require 'rails_helper'

  describe "User must log in to proceed to checkout", type: :feature do
    before(:each) do
      category = Category.create!(title: "Slammers")
      item_1 = category.items.create!(
                                      title: "Lion Holographic Slammer",
                                      price: 3.0,
                                      description: "1/4 thick brass, saw-shaped slammer with holographic lion",
                                      image_path: "http://www.the90swereawesome.com/wp-content/uploads/2014/08/intricate.jpg",
                                      )
    end

    context "when they haven't logged in" do
      scenario "and they go to My Cart" do

        visit items_path
        click_on "Add to Cart"
        save_and_open_page
        expect(page).to_not have_content("Log out")
        click_on "My Cart"
        expect(page).to_not have_content("Proceed to checkout")
      end
    end

    context "when they have logged in" do
      scenario "and they got to My Cart" do
        user = User.create(
                            first_name: "John",
                            last_name: "Doe",
                            email: "johndoe@gmail.com",
                            password: "password"
                            )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit items_path
        click_on "Add to Cart"
        expect(page).to have_content("Log out")
        click_on "My Cart"
        expect(page).to have_button("Proceed to checkout")
      end
    end
  end
