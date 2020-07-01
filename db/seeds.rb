# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TODO: drop tables first
u = User.create(first_name: "thea", last_name: "harvey-brown", password: "Welcome1", email: "tharveybrown@gmail.com")
ent = Entity.create(name: "EJI")
exp = Expense.create(user: u, entity: ent, amount: 10.5, recurring: false)