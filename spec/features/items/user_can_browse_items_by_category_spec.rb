require 'rails_helper'

RSpec.feature "Vistor can see all items assigned to a category" do
  scenario "they see all items assigned to that category on its page" do
    pogs = Category.create(title: "Pogs")
    item_1 = pogs.items.create(
            title: "8-ball pack",
            price: 10.99,
            description: "30 assorted 8-ball themed pogs.",
            image_path: '8ballpogs.jpg',
            category: pogs
            )
    item_2 = pogs.items.create(
            title: "NFL pack",
            price: 15.99,
            description: "32 pog set; one for each NFL team!",
            image_path: 'NFL-Team-Caps.jpg',
            category: pogs
            )

    slammers = Category.create(title: "Slammers")
    item_3 = slammers.items.create(
            title: "T-Rex",
            price: 3.50,
            description: "Holographic T-Rex slammer.",
            image_path: 't_rex_slammer.JPG',
            category: slammers
            )
    item_4 = slammers.items.create(
            title: "Mike Tyson",
            price: 7.99,
            description: "No slammer slams harder than Iron Mike Tyson!",
            image_path: 'mike_tyson_slammer.jpg',
            category: slammers
            )

    visit category_path(slammers)

    expect(current_path).to eq '/categories/slammers'
    expect(page).to have_content("Slammers")
    expect(page).to have_content("T-Rex")
    expect(page).to have_content("Mike Tyson")

  end
end
