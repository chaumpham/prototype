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
  {name: "black AX pants", status: 1, color: "black", pattern: "solid", size: "XS", brand: "Armani Exchange", user_id:1},
  {name: "b&w JC vest", status:1, color: "multi", pattern: "striped", size: "XXS", brand: "J.Crew", user_id:1},
  {name: "champion crewneck sweater", status:1, color: "black", pattern:"solid", size: "S", brand: "Champion", user_id:1},
  {name: "zara plaid blouse with sequin collar", status:1, color: "multi", pattern:"checked", size: "XS", brand: "Zara", user_id:1},
  {name: "gray thermo legging", status:1, color: "gray", pattern:"solid", size: "XS", brand: "UNIQLO", user_id:1},
  {name: "plaid oversized shirt", status:1, color: "multi", pattern:"checked", size: "XS", brand: "nordstrom", user_id:1, image: "https://cdna.lystit.com/photos/63c9-2016/01/21/zara-rednavy-check-shirt-red-product-2-044768255-normal.jpeg"},
  {name: "body fit long sleeved shirt", status:1, color: "black", pattern:"solid", size: "XXS", brand: "J.Crew", user_id:1},
  {name: "maroon fit sweater", status:1, color: "maroon", pattern:"solid", size: "S", brand: "Forever 21", user_id:2},
  {name: "puma sneakers", status:1, color: "multi", pattern:"striped", size: "8", brand: "puma", user_id:2},
  {name: "gray cardigan", status:1, color: "gray", pattern:"solid", size: "XS", brand: "unknown", user_id:3},
  {name: "body fit ivory crewneck lightweight sweater", status:1, color: "ivory", pattern:"solid", size: "M", brand: "H&M", user_id:4},
  {name: "straight cut jeans", status:1, color: "navy", pattern:"solid", size: "32", brand: "J.Crew", user_id:4},
  {name: "zara winter coat navy", status:1, color: "navy", pattern:"solid", size: "S", brand: "Zara", user_id:1, image: "https://dtpmhvbsmffsz.cloudfront.net/posts/2016/10/01/57f0648f4127d005950191a5/m_57f0648f4127d005950191a6.jpg"}
])

