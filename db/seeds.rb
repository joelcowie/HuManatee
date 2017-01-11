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
User.create(first_name: "Ian", last_name: "Candy", email: "ian@candy.com", password:"joel", password_confirmation:"joel")

Event.create(title: "Hot Dog Eating Contest For The kids", description: "Is Hot Dog A Sandwich", creator_id: 1, level: "local", category: "Environment", start_date: "01-01-2017 12:15", end_date: "01-02-2017 13:25") #Ongoing

Event.create(title: "clean up da streetz", description: "Clean streetz tho?", creator_id: 4, level: "local", category: "Environment", start_date: "03-01-2017 12:15", end_date: "03-01-2017 15:00") #Past

Event.create(title: "clean up my apartment", description: "I need help moving", creator_id: 3, level: "Peer", category: "Apartment", start_date: "02-01-2017 12:15", end_date: "02-10-2017 15:00") #Ongoing

Event.create(title: "soup kitchen", description: "volunteer at soup kitchens", creator_id: 2, level: "local", category: "help needy", start_date: "10-04-2017 12:30", end_date: "11-04-2017 16:15") #Upcoming

Event.create(title: "blood drive", description: "1 pint of O negative", creator_id: 1, level: "local", category: "donation", start_date: "12-12-2016 12:00", end_date: "13-12-2016 18:00") #Past

Event.create(title: "read at children's hospital", description: "they like green eggs and ham", creator_id: 1, level: "local", category: "service", start_date: "12-12-2017 12:15", end_date: "13-12-2017 15:00") #Upcoming

Event.create(title: "Flatiron Clean up", description: "This place is a mess", creator_id: 4, level: "local", category: "service", start_date: "28-11-2016 9:00", end_date: "28-2-2017 18:00") #ongoing

Attendee.create(user_id: 1, event_id: 1)
Attendee.create(user_id: 2, event_id: 1)
Attendee.create(user_id: 3, event_id: 1)
Attendee.create(user_id: 4, event_id: 1)

Attendee.create(user_id: 1, event_id: 2)
Attendee.create(user_id: 3, event_id: 2)
Attendee.create(user_id: 4, event_id: 2)

Attendee.create(user_id: 1, event_id: 3)
Attendee.create(user_id: 3, event_id: 3)

Attendee.create(user_id: 1, event_id: 4)
Attendee.create(user_id: 2, event_id: 4)

Attendee.create(user_id: 1, event_id: 5)
Attendee.create(user_id: 2, event_id: 5)
Attendee.create(user_id: 3, event_id: 5)

Attendee.create(user_id: 1, event_id: 6)
Attendee.create(user_id: 4, event_id: 6)

Attendee.create(user_id: 1, event_id: 7)
Attendee.create(user_id: 2, event_id: 7)
Attendee.create(user_id: 4, event_id: 7)


Comment.create(user_id:4, event_id:1, description: "Not a sandwich")
Comment.create(user_id:1,  event_id:1, description: "YA, it is")

Review.create(sender_id:4, receiver_id:1, description: "I love his jokes", rating:5)
Review.create(sender_id:2, receiver_id:1, description: "ok kid", rating:3)
