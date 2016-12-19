
# File.readlines("db/grocery_database.txt").each do |line|
#   Keyword.create(item: line.chomp, name: "Grocery Store")
# end


# User.create(username: "test", password_digest: "test", facebook_id: 1)
# List.create(name: "Grocery List", user_id: 1)
# Item.create(name: "Video Games", list_id: 1, keyword: nil)
# Item.create(name: "Reese's Puffs", list_id: 1, keyword: nil)
# Item.create(name: "budweiser", list_id: 1, keyword: nil)
# Item.create(name: "Doritos", list_id: 1, keyword: nil)
# Item.create(name: "Downey", list_id: 1, keyword: nil)

# Item.create(name: "Video Games", list_id: 1, keyword: nil)


video_game_search = JSON.parse(open("https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=name&limit=10&offset=0&order=release_dates.date%3Adesc&search=zelda",
"X-Mashape-Key" => "z40MPygxW3mshJmuIzjgWTkV6GiXp13WFyUjsnAU30HUbmBZju").read)

p video_game_search
