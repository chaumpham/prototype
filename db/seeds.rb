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

item = Item.new({name: "black AX pants", status: 1, color: "black", pattern: "solid", size: "XS", brand: "Armani Exchange", user_id:1, image: "https://cdn.yoox.biz/46/46532179ag_13_f.jpg"})
item.save

item = Item.new({name: "b&w JC vest", status:1, color: "multi", pattern: "striped", size: "XXS", brand: "J.Crew", user_id:1, image: "https://i.s-jcrewfactory.com/is/image/jcrew/G7626_WE8741_m?$pdp_enlarge$"})
item.save

item = Item.new({name: "champion crewneck sweater", status:1, color: "black", pattern:"solid", size: "S", brand: "Champion", user_id:1, image: "https://www.shopakira.com/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/h/champion-reverse-weave-crew-sweatshirt_navy_2.jpg"})
item.save

item = Item.new({name: "zara plaid blouse with sequin collar", status:1, color: "multi", pattern:"checked", size: "XS", brand: "Zara", user_id:1, image: "https://images.hellogiggles.com/uploads/2017/12/28014935/zara-mini.jpg"})
item.save

item = Item.new({name: "gray thermo legging", status:1, color: "gray", pattern:"solid", size: "XS", brand: "UNIQLO", user_id:1, image: "https://uniqlo.scene7.com/is/image/UNIQLO/goods_08_172177?$detail$"})
item.save

item = Item.new({name: "plaid oversized shirt", status:1, color: "multi", pattern:"checked", size: "XS", brand: "nordstrom", user_id:1, image: "https://cdnb.lystit.com/photos/ef52-2015/07/28/madewell-nouveau-red-oversized-boyshirt-in-edina-plaid-red-product-3-930310065-normal.jpeg"})
item.save

item = Item.new({name: "body fit long sleeved shirt", status:1, color: "black", pattern:"solid", size: "XXS", brand: "J.Crew", user_id:1, image: "https://www.jcrew.com/s7-img-facade/B1304_BK0001_m?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&wid=636&hei=636"})
item.save

item = Item.new({name: "maroon fit sweater", status:1, color: "maroon", pattern:"solid", size: "S", brand: "Forever 21", user_id:2, image: "http://www.forever21.com/images/1_front_750/00148569-04.jpg"})
item.save

item = Item.new({name: "puma sneakers", status:1, color: "multi", pattern:"striped", size: "8", brand: "puma", user_id:2, image: "https://i.pinimg.com/originals/3b/9f/8b/3b9f8ba6ffa247884b8a8f3776b4cbee.jpg"})
item.save

item = Item.new({name: "gray cardigan", status:1, color: "gray", pattern:"solid", size: "XS", brand: "unknown", user_id:3, image: "https://a248.e.akamai.net/media.zulily.com/images/cache/product//266797/zu51995805_main_tm1508087125.jpg"})
item.save

item = Item.new ({name: "body fit ivory crewneck lightweight sweater", status:1, color: "ivory", pattern:"solid", size: "M", brand: "H&M", user_id:4, image: "https://cdnb.lystit.com/photos/c6eb-2015/08/27/stephan-schneider-ivory-mens-grid-pullover-white-product-1-469636806-normal.jpeg"})
item.save

item = Item.new({name: "straight cut jeans", status:1, color: "navy", pattern:"solid", size: "32", brand: "J.Crew", user_id:4, image: "http://s7d9.scene7.com/is/image/NauticaBrand/xxlarge/0731516000016_7P3518_401_A.jpg"})
item.save

order = Order.new({item_id:4, borrower_id:2, owner_id:1,return_date: DateTime.new(2018, 1, 10), accepted:true})
order.save

