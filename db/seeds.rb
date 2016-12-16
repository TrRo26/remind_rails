User.create(username: "test", password_digest: "password")
List.create(name: "Grocery Store", user_id: 1)
Item.create(name: "Orange", list_id: 1)
Item.create(name: "Apples", list_id: 1)
Item.create(name: "Cookies", list_id: 1)

