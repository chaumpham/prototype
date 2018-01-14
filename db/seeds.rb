# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new({email: "cp@gmail.com", password: "test1", first_name: "Chau", last_name: "Pham"})
user.save

user = User.new({email: "ss@gmail.com", password: "test2", first_name: "Shvetha", last_name: "Suvarna"})
user.save

user = User.new({email: "jp@gmail.com", password: "test3", first_name: "Jaewon", last_name: "Park"})
user.save

user = User.new({email: "ac@gmail.com", password: "test4", first_name: "Allen", last_name: "Cheng"})
user.save

item = Item.new({name: "black AX pants", status: 1, color: "black", pattern: "solid", size: "XS", brand: "Armani Exchange", user_id:1})
item.save

item = Item.new({name: "b&w JC vest", status:1, color: "multi", pattern: "striped", size: "XXS", brand: "J.Crew", user_id:1})
item.save

item = Item.new({name: "champion crewneck sweater", status:1, color: "black", pattern:"solid", size: "S", brand: "Champion", user_id:1})
item.save

item = Item.new({name: "zara plaid blouse with sequin collar", status:1, color: "multi", pattern:"checked", size: "XS", brand: "Zara", user_id:1})
item.save

item = Item.new({name: "gray thermo legging", status:1, color: "gray", pattern:"solid", size: "XS", brand: "UNIQLO", user_id:1})
item.save

item = Item.new({name: "plaid oversized shirt", status:1, color: "multi", pattern:"checked", size: "XS", brand: "nordstrom", user_id:1})
item.save

item = Item.new({name: "body fit long sleeved shirt", status:1, color: "black", pattern:"solid", size: "XXS", brand: "J.Crew", user_id:1})
item.save

item = Item.new({name: "maroon fit sweater", status:1, color: "maroon", pattern:"solid", size: "S", brand: "Forever 21", user_id:2})
item.save

item = Item.new({name: "puma sneakers", status:1, color: "multi", pattern:"striped", size: "8", brand: "puma", user_id:2})
item.save

item = Item.new({name: "gray cardigan", status:1, color: "gray", pattern:"solid", size: "XS", brand: "unknown", user_id:3})
item.save

item = Item.new ({name: "body fit ivory crewneck lightweight sweater", status:1, color: "ivory", pattern:"solid", size: "M", brand: "H&M", user_id:4})
item.save

item = Item.new({name: "straight cut jeans", status:1, color: "navy", pattern:"solid", size: "32", brand: "J.Crew", user_id:4})
item.save

order = Order.new({item_id:4, borrower_id:2, owner_id:1,return_date: DateTime.new(2018, 1, 10), accepted:true})
order.save

