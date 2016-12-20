
File.readlines("db/grocery_database.txt").each do |line|
  Keyword.create(item: line.chomp, name: "Grocery Store")
end


User.create(username: "test", password_digest: "test", facebook_id: 1)
List.create(name: "Grocery List", user_id: 1)
Item.create(name: "Video Games", list_id: 1, keyword: nil)
Item.create(name: "Reese's Puffs", list_id: 1, keyword: nil)
Item.create(name: "budweiser", list_id: 1, keyword: nil)
Item.create(name: "Doritos", list_id: 1, keyword: nil)
Item.create(name: "Downey", list_id: 1, keyword: nil)

# Item.create(name: "Video Games", list_id: 1, keyword: nil)
# Item.create(name: "halo", list_id: 1, keyword: nil)
# Item.create(name: "kleenex", list_id: 1, keyword: nil)
# Item.create(name: "world of warcraft", list_id: 1, keyword: nil)
# Item.create(name: "tomato", list_id: 1, keyword: nil)

# Item.create(name: "Halo Wars", list_id: 1, keyword: nil)
# Item.create(name: "battlefield", list_id: 1, keyword: nil)
