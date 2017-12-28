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

order = Order.new({item_id:1, borrower_id:2, owner_id:1,return_date: DateTime.new(2017, 12, 17), accepted:true})
order.save