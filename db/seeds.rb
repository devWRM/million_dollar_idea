# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Idea.destroy_all
Category.destroy_all
Resource.destroy_all
Support.destroy_all


abe = User.create(username: "Abraham", email: "abe@email.com", password: "abe")
bea = User.create(username: "Beatrice", email: "bea@email.com", password: "bea")
cc = User.create(username: "Celia", email: "cc@email.com", password: "cc")
dee = User.create(username: "DeAnna", email: "dee@email.com", password: "dee")


cat1 = Category.create(label: "Recreation")
cat2 = Category.create(label: "Food")
cat3 = Category.create(label: "Beverage")
cat4 = Category.create(label: "Entertainment")
cat5 = Category.create(label: "Clothing")
cat6 = Category.create(label: "Footwear")
cat7 = Category.create(label: "Health")
cat8 = Category.create(label: "Home Improvement")
cat9 = Category.create(label: "Motor Vehicles")
cat10 = Category.create(label: "Beauty Care")


i1 = Idea.create(title: "Cookie Diet", inspiration: "Love cookies but they wreck my waistline", plan: "Create weight-loss cookies.", budgeted_dollars: 7700, spent_dollars: 700, category_id: 2, user_id: 4)
i2 = Idea.create(title: "Water Walkers", inspiration: "Peter and Jesus", plan: "Create shoes that enables the wearer to walk on water.", budgeted_dollars: 1000, spent_dollars: 52, category_id: 1, user_id: 2)


res1 = Resource.create(source: "Volunteers", idea_id: 1)
res2 = Resource.create(source: "Internet", idea_id: 1)
res3 = Resource.create(source: "Library", idea_id: 1)
res4 = Resource.create(source: "Library", idea_id: 2)




