# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

people = [
    {:email => "ron.swanson@aol.com", :password => "pass1234", :firstname => "Ron", :lastname => "Swanson", :admin => true},
    {:email => "harrypotter@yahoo.com", :password => "pass1234", :firstname => "Harry", :lastname => "Potter"},
    {:email => "mgriff@gmail.com", :password => "pass1234", :firstname => "Meg", :lastname => "Griffin"},
    {:email => "lmao@gmail.com", :password => "pass1234", :firstname => "Ryan", :lastname => "Lewis"},
    {:email => "gandalf@aol.com", :password => "pass1234", :firstname => "Gandalf", :lastname => "White"}
]
admin1 = User.create(people[0])
user_no_review1 = User.create(people[1])
user_no_review2 = User.create(people[2])
user_review1 = User.create(people[3])
user_review2 = User.create(people[4])


categories = [{:name => "Magic stuff"}, {:name => "Big discounts"}]

category1 = Category.create(categories[0])
category2 = Category.create(categories[1])

products = [
    {:title => "Magic wand", :description => "thin, hand-held stick or rod made of wood, stone,
          ivory, or metals like gold or silver.", :price => 566.99, :category_id => category1.id, :user_id => user_no_review1.id},
    {:title => "Microwave", :description => "It's a really good microvawe. What else can I say?", :price => 44.44, :category_id => category1.id, :user_id => user_no_review1.id },
    {:title => "Magic powder", :description => "Hey, wanna buy some magic?", :price => 0.01, :category_id => category1.id, :user_id => user_review2.id },
    {:title => "Piece of Eden", :description => "Technologically advanced devices created by the First Civilization for various purposes. Buy one, get second one for free", :price => 23.30, :category_id => category2.id, :user_id => user_review1.id},
    {:title => "Oxygen", :description => "For the love of Chemistry", :price => 1.1, :category_id => category2.id, :user_id => user_review1.id}
]
products_ids = []
products.each do |product|
  temp = Product.create(product)
  products_ids.push(temp.id)
end


reviews = [
    {:content=>"Really, this changed my life! Big plus for the quality of materials", :rating => 5, :product_id => products_ids[0], :user_id => user_review1.id},
    {:content=>"I really felt the magic! You should try this", :rating => 4, :product_id => products_ids[2], :user_id => user_review1.id},
    {:content=>"Not bad.", :rating => 5, :product_id => products_ids[2], :user_id => user_review1.id},
    {:content=>"Quite good product in this price range", :rating => 3, :product_id => products_ids[1], :user_id => user_review1.id},
    {:content=>"No.", :rating => 2, :product_id => products_ids[3], :user_id => user_review2.id},
    {:content=>"Yes.", :rating => 3, :product_id => products_ids[3], :user_id => user_review2.id},
    {:content=>"I don't even know why I decided to purchase this... thing. Big negative.", :rating => 1, :product_id => products_ids[0], :user_id => user_review2.id}
]

reviews.each do |review|
  Review.create(review)
end