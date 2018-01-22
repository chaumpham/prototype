# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {email: "cp@gmail.com", password: "test1", first_name: "Chau", last_name: "Pham"},
  {email: "ss@gmail.com", password: "test2", first_name: "Shvetha", last_name: "Suvarna"},
  {email: "jp@gmail.com", password: "test3", first_name: "Jaewon", last_name: "Park"},
  {email: "ac@gmail.com", password: "test4", first_name: "Allen", last_name: "Cheng"},
  {email: "ks@gmail.com", password: "test5", first_name: "Katie", last_name: "Stych"},
  {email: "cc@gmail.com", password: "test6", first_name: "Carrie", last_name: "Chui"}
])

Item.create([
  {name: "RUNAROUND SUPER SKINNY JEANS", status: 1, color: "black", pattern: "solid", size: "XS", brand: "Levi's", user_id:1},
  {name: "PRINTED QUILTED PUFFER VEST", status:1, color: "multi", pattern: "printed", size: "XXS", brand: "J.Crew", user_id:1},
  {name: "CHAMPION CREWNECK SWEATER", status:1, color: "black", pattern:"solid", size: "S", brand: "Champion", user_id:1},
  {name: "CHECKED TOP WITH SEQUIN COLLAR", status:1, color: "multi", pattern:"checked", size: "XS", brand: "Zara", user_id:1},
  {name: "ALL SAINTS PENRYN JUMPER", status:1, color: "gray", pattern:"solid", size: "XS", brand: "all saints", user_id:1},
  {name: "OVERSIZED FLANNEL", status:1, color: "red", pattern:"checked", size: "XS", brand: "nordstrom", user_id:1},
  {name: "FAUX FUR HOOD WINTER JACKET", status:1, color: "navy", pattern:"solid", size: "XS", brand: "Zara", user_id:1},
  {name: "ALL SAINTS CARME STRIPE TEE", status:1, color: "multi", pattern:"striped", size: "XXS", brand: "J.Crew", user_id:1},
  {name: "EMERAL CROPPED SWEATER", status:1, color: "green", pattern:"solid", size: "S", brand: "Forever 21", user_id:2},
  {name: "GRAY LONG CARDIGAN", status:1, color: "gray", pattern:"solid", size: "XXS", brand: "LOFT", user_id:3},
  {name: "CREWNECK LIGHTWEIGHT FITTING SWEATER", status:1, color: "beige", pattern:"solid", size: "L", brand: "H&M", user_id:4},
  {name: "STRIGHT CUT JEANS", status:1, color: "navy", pattern:"solid", size: "32", brand: "J.Crew", user_id:4},
  {name: "PINK PUFFER JACKET", status:1, color: "pink", pattern:"solid", size: "S", brand: "Super Dry", user_id:5},
  {name: "BLACK DRESS", status:1, color: "black", pattern:"solid", size: "M", brand: "ZARA", user_id:6},
  {name: "BEIGE SOFT SWEATER", status:1, color: "beige", pattern:"solid", size: "S", brand: "H&M", user_id:6}
])

