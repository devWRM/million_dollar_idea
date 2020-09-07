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






abe = User.create(username: "Abraham", email: "abe@email.com", password: "abe")
bea = User.create(username: "Beatrice", email: "bea@email.com", password: "bea")
cc = User.create(username: "Celia", email: "cc@email.com", password: "cc")
dee = User.create(username: "DeAnna", email: "dee@email.com", password: "dee")


i1 = dee.ideas.create(title: "Cookie Diet", inspiration: "Love cookies but they wreck my waistline", plan: "Create weight-loss cookies.", budgeted_dollars: 7700, spent_dollars: 700)
i2 = cc.ideas.create(title: "Water Walkers", inspiration: "Peter and Jesus", plan: "Create shoes that enables the wearer to walk on water.", budgeted_dollars: 1000, spent_dollars: 52)
i3 = abe.ideas.create(title: "Body Bag", inspiration: "Medical gloves protect hands", plan: "Create full body coverage to protect from Covid.", budgeted_dollars: 20000, spent_dollars: 30000)



res1 = i2.resources.create(source: "Library")
res2 = i3.resources.create(source: "Parents")
res3 = i1.resources.create(source: "Volunteers")
res4 = i1.resources.create(source: "Library")
res5 = i1.resources.create(source: "Parents")

cat1 = i2.categories.create(label: "Recreation")
cat2 = i1.categories.create(label: "Food")
cat3 = i1.categories.create(label: "Health")
cat4 = i2.categories.create(label: "Clothing")
cat5 = i3.categories.create(label: "Clothing")


# g1 = Goal.create(statement: "Reverse the world obesity epidemic", idea_id: 1, category_id: 2)
# g2 = Goal.create(statement: "Increase the world's walking surface utilizing bodies of water.", idea_id: 2, category_id: 4)


# s1 = Support.create(budgeted_dollars: 100, spent_dollars: 10, budgeted_dollars_remaining: 90, within_budget: true, idea_id: 1, resource_id: 3)
# s2 = Support.create(budgeted_dollars: 500, spent_dollars: 50, budgeted_dollars_remaining: 450, within_budget: true, idea_id: 2, resource_id: 1)



