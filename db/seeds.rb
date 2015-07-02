# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# test_items = Item.create([{name: 'test 1 item name', api_id: 'test 1 api id', category: 'test 1 category'}, {name: 'test 2 item name', api_id: 'test 2 api id', category: 'test 2 category'}])


produce_items = Item.create([{name: 'apple', category: 'produce', description: 'They say an apple a day keeps the doctor away...'}, {name: 'orange', category: 'produce'}, {name: 'carrot', category: 'produce'}, {name: 'potato', category: 'produce'}, {name: 'broccoli', category: 'produce'}])

candy_items = Item.create([{name: 'chocolate', category: 'candy', description: 'Very delicious. Dark chocolate makes you live longer.'}])

protein_items = Item.create([{name: 'chicken', category: 'meat/fish/poultry'}, {name: 'salmon', category: 'meat/fish/poultry'}, {name: 'ground beef', category: 'meat/fish/poultry'}, {name: 'lamb chops', category: 'meat/fish/poultry'}, {name: 'bacon', category: 'meat/fish/poultry'}])

dairy_items = Item.create([{name: 'milk', category: 'dairy', shelf_life_days: 7}, {name: 'yogurt', category: 'dairy', shelf_life_days: 7}, {name: 'cheese', category: 'dairy', shelf_life_days: 7}, {name: 'butter', category: 'dairy', shelf_life_days: 7}])

bakery_items = Item.create([{name: 'bread', category: 'bakery'}, {name: 'bagels', category: 'bakery'}, {name: 'muffins', category: 'bakery'}, {name: 'pita bread', category: 'bakery'}])

boxed_and_canned_items = Item.create([{name: 'cereal', category: 'boxed and canned goods', description: 'Breakfast of champions. Get your fiber in.'}, {name: 'pasta', category: 'boxed and canned goods'}, {name: 'beans', category: 'boxed and canned goods'}, {name: 'rice', category: 'boxed and canned goods'}])

beverage_items = Item.create([{name: 'coffee', category: 'beverage', description: 'The foundation of modern civilization. Coffee gets your java going. Buzz, buzz, buzz.'}, {name: 'tea', category: 'beverage'}, {name: 'orange juice', category: 'beverage'}])

frozen_items = Item.create([{name: 'ice cream', category: 'frozen'}, {name: 'peas', category: 'frozen'}, {name: 'frozen yogurt', category: 'frozen'}, {name: 'frozen pizza', category: 'frozen'}])

spices_and_herbs = Item.create([{name: 'salt', category: 'spices and herbs'}, {name: 'cinnamon', category: 'spices and herbs'}, {name: 'bay leaves', category: 'spices and herbs'}])

non_food_items = Item.create([{name: 'dish soap', category: 'non-food items'}, {name: 'garbage bags', category: 'non-food items'}, {name: 'tin foil', category: 'non-food items'}, {name: 'toilet paper', category: 'non-food items'}, {name: 'laundry soap', category: 'non-food items'}, {name: 'dry erase markers', category: 'non-food items', description: 'There are never enough. Buy in bulk.'}, {name: 'hand sanitizer', category: 'non-food items', description: 'No explanation needed.'}])


test_relation = Itemsuser.create([{user_id: 1, item_id: 24, purchase_freq: 3.0, recent_purchase: 5.days.ago, total_purchases: 3}, {user_id: 1, item_id: 6, purchase_freq: 2.0, recent_purchase: 5.days.ago, total_purchases: 4}, {user_id: 1, item_id: 39, purchase_freq: 2.0, recent_purchase: 5.days.ago, total_purchases: 4}, {user_id: 1, item_id: 40, purchase_freq: 2.0, recent_purchase: 5.days.ago, total_purchases: 4}, {user_id: 1, item_id: 20, purchase_freq: 2.0, recent_purchase: 5.days.ago, total_purchases: 4}, {user_id: 1, item_id: 1, purchase_freq: 365.0, recent_purchase: 5.days.ago, total_purchases: 4}])
