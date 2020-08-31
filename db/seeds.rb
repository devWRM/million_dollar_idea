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
Goal.destroy_all
Resource.destroy_all
Support.destroy_all






abe = User.create(username: "Abraham", email: "abe@email.com")
bea = User.create(username: "Beatrice", email: "bea@email.com")
cc = User.create(username: "Celia", email: "cc@email.com")
dee = User.create(username: "DeAnna", email: "dee@email.com")

res1 = Resource.create(source: "Library")
res2 = Resource.create(source: "Parents")
res3 = Resource.create(source: "Volunteers")

cat1 = Category.create(label: "Entertainment")
cat2 = Category.create(label: "Food")
cat3 = Category.create(label: "Medical")
cat4 = Category.create(label: "Clothing")
cat5 = Category.create(label: "Fashion")


i1 = dee.ideas.create(title: "Cookie Diet", inspiration: "Love cookies but they wreck my waistline", plan: "Create weight-loss cookies.")
i2 = cc.ideas.create(title: "Water Walkers", inspiration: "Peter and Jesus", plan: "Create shoes that enables the wearer to walk on water.")
i3 = abe.ideas.create(title: "Body Bag", inspiration: "Medical gloves protect hands", plan: "Create full body coverage to protect from Covid.")


g1 = Goal.create(statement: "Reverse the world obesity epidemic", idea_id: 1, category_id: 2)
g2 = Goal.create(statement: "Increase the world's walking surface utilizing bodies of water.", idea_id: 2, category_id: 4)


s1 = Support.create(budgeted_dollars: 100, spent_dollars: 10, budgeted_dollars_remaining: 90, within_budget: true, idea_id: 1, resource_id: 3)
s2 = Support.create(budgeted_dollars: 500, spent_dollars: 50, budgeted_dollars_remaining: 450, within_budget: true, idea_id: 2, resource_id: 1)



