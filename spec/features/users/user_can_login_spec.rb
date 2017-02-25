require 'rails_helper'

  describe "User can log in to their account" do
    context "with valid credentials" do
      scenario "they click on log in button" do
        user = User.create(
                           first_name: "John",
                           last_name: "Doe",
                           email: "johndoe@gmail.com",
                           password: "password"
                           )

      visit root_path

      click_on "Log In"
      expect(current_path).to eq('/login')

      fill_in "session[email]", with: "johndoe@gmail.com"
      fill_in "session[password]", with: "password"
      click_on "Login"

      expect(page).to have_content "Logged in as John Doe"

      expect(current_path).to eq('/dashboard')

      within("h1.greeting") do
        expect(page).to have_content "Welcome John"
      end
      expect(page).to have_content "First Name: John"
      expect(page).to have_content "Log out"
      end
    end

    context "with INvalid credentials" do
      scenario "they click on log in button" do
        user = User.create(
                           first_name: "John",
                           last_name: "Doe",
                           email: "johndoe@gmail.com",
                           password: "password"
                           )

      visit root_path
      click_on "Log In"
      expect(current_path).to eq('/login')

      fill_in "session[email]", with: "johndoe@gmail.com"
      fill_in "session[password]", with: "notpassword"
      click_on "Login"

      expect(page).to have_content "Incorrect email and/or password"

      expect(current_path).to eq login_path
      end
    end
  end
