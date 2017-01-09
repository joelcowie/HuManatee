# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Joel", last_name: "Cowie", email: "joel@joel.com")
Event.create(title: "Event", description: "Clean flatiron", creator_id: 1, level: "local", category: "Environment", start_date: "01-01-2017", end_date: "01-02-2017")
Attendee.create(user_id: 1, event_id: 1)
