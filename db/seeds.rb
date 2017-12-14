# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.new({email: "cp@gmail.com", password: "test1", first_name: "Chau", last_name: "Pham"})
# user.save

# user = User.new({email: "ss@gmail.com", password: "test2", first_name: "Shvetha", last_name: "Suvarna"})
# user.save

item = Item.new({name: "black AX pants", status: 1, color: "black", type: "pants", pattern: "solid", size: "XS", brand: "Armani Exchange", user_id: 1})
item.save