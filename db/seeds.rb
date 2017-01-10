# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Joel", last_name: "Cowie", email: "joel@joel.com", password:"joel", password_confirmation:"joel")
User.create(first_name: "Jon", last_name: "Z", email: "jon@jon.com", password:"joel", password_confirmation:"joel")
User.create(first_name: "Jackson", last_name: "Jackson", email: "jackson@jackson.com", password:"joel", password_confirmation:"joel")


Event.create(title: "Flatiron Clean Up", description: "Clean flatiron", creator_id: 1, level: "local", category: "Environment", start_date: "01-01-2017 12:15", end_date: "01-02-2017 13:25") #Ongoing

Event.create(title: "clean up streetZ", description: "Clean those streetZ", creator_id: 2, level: "local", category: "Environment", start_date: "03-01-2017 12:15", end_date: "03-01-2017 15:00") #Past

Event.create(title: "clean up my apartment", description: "I need help", creator_id: 3, level: "Peer", category: "Apartment", start_date: "02-01-2017 12:15", end_date: "02-10-2017 15:00") #Ongoing

Event.create(title: "Clean shit", description: "I need help with stuff", creator_id: 3, level: "Peer", category: "Apartment", start_date: "02-03-2017 12:15", end_date: "02-10-2017 15:00") #Upcoming

Attendee.create(user_id: 1, event_id: 1)
Attendee.create(user_id: 2, event_id: 1)
Attendee.create(user_id: 3, event_id: 1)

Attendee.create(user_id: 1, event_id: 2)
Attendee.create(user_id: 3, event_id: 2)

Attendee.create(user_id: 2, event_id: 3)
Attendee.create(user_id: 1, event_id: 3)

Attendee.create(user_id: 1, event_id: 4)
