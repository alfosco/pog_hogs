category_1 = Category.create(title: "Slammers")
category_2 = Category.create(title: "Boards")
category_3 = Category.create(title: "Cases")
category_4 = Category.create(title: "Pogs")
category_5 = Category.create(title: "Sets")

slammer_1 = category_1.items.create(
        title: "OJ Simpson Slammer",
        price: 42.34,
        description: "OJ Simpson in the slammer, on a slammer!",
        image_path: 'OJ_slammer.jpg',
        )
slammer_2 = category_1.items.create(
        title: "Holographic Lion Slammer",
        price: 42.34,
        description: "Brass Holographic Lion Slammer shaped like a saw blade",
        image_path: '/app/assets/images/hol_lion_slammer.jpg',
        )
slammer_3 = category_1.items.create(
        title: "T-Rex Slammer",
        price: 5.99,
        description: "Holographic T-Rex Slammer, 1/4inch thick brass",
        image_path: '/app/assets/images/t_rex_slammer.JPG',
        )
slammer_4 = category_1.items.create(
        title: "Mortal Kombat Trophy Edition Slammer",
        price: 3.69,
        description: "Mortal Kombat Trophy Edition Slammer, one of only 300 made",
        image_path: '/app/assets/images/MK_slammer.jpg',
        )

set_1 = category_5.items.create(
        title: "8-ball pack",
        price: 10.99,
        description: "30 assorted 8-ball themed pogs.",
        image_path: '/app/assets/images/8ballpogs.jpg',
        )
set_2 = category_5.items.create(
        title: "Simpsons 25 piece set",
        price: 23.99,
        description: "Simpsons 25 piece set including every major character!",
        image_path: '/app/assets/images/simpsons_25pc_set.jpg',
        )
set_3 = category_5.items.create(
        title: "NFL Team Pog Set",
        price: 12.73,
        description: "Includes all your favorite teams like the Houston Oilers, LA Raiders, St. Louis Rams",
        image_path: '/app/assets/images/NFL-Team-Caps.jpg',
        )
pog_1 = category_4.items.create(
        title: "King of Cool Pog",
        price: 0.49,
        description: "King of Cool foil pog",
        image_path: '/app/assets/images/king_of_cool_foil.jpg',
        )
pog_2 = category_4.items.create(
        title: "Original Pog Brand Poggie Relaxing",
        price: 1.09,
        description: "An original Pog Brand pog with foil rim",
        image_path: '/app/assets/images/pog_pog.jpg',
        )
pog_3 = category_4.items.create(
        title: "Sonic the HedgeHog Pog",
        price: 0.65,
        description: "Sega's Sonic comes to you on a pog",
        image_path: '/app/assets/images/sonic_pog.png',
        )
pog_4 = category_4.items.create(
        title: "D.A.R.E. Pog",
        price: 0.40,
        description: "Stay drug free with this DARE pog",
        image_path: '/app/assets/images/dare_pog.jpg',
        )
case_1 = category_3.items.create(
        title: "50 Count Pog Case in Assorted Colors",
        price: 4.79,
        description: "50 count cases for your pogs available in assorted colors",
        image_path: '/app/assets/images/50-count_case.jpg',
        )
case_2 = category_3.items.create(
        title: "200 Count Pog Case in Assorted Colors",
        price: 9.79,
        description: "200 count cases for your pogs available in assorted colors",
        image_path: '/app/assets/images/200-count_case.jpg',
        )
board_1 = category_2.items.create(
        title: "Official Pog Brand Game Board",
        price: 14.95,
        description: "Offical Pog Brand hard gameboard",
        image_path: '/app/assets/images/pog_brand_board.jpg',
        )
board_2 = category_2.items.create(
        title: "Offical Tournament Game Board",
        price: 22.31,
        description: "Official pog tournament gameboard with holders for all of your winnings",
        image_path: '/app/assets/images/official_tournament_board.jpg',
        )
board_3 = category_2.items.create(
        title: "Face-Off Game Board",
        price: 11.99,
        description: "Face-Off game board, rare square design",
        image_path: '/app/assets/images/face-off_board.jpg',
        )


# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
