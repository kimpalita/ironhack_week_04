# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contact = Contact.create name: 'Anna', surname: nil, address: 'Park Lane 23450'
contact.emails.create email_address: 'anna@example.com'
contact.emails.create email_address: 'anna@otheremail.com'
contact.telephones.create phone_number: rand(100000000..999999999)
contact.telephones.create phone_number: rand(100000000..999999999)

contact = Contact.create name: 'Beth', surname: 'Gray', address: 'Somewhere Berlin'
contact.emails.create email_address: 'beth@example.com'
contact.emails.create email_address: 'beth@otheremail.com'
contact.telephones.create phone_number: rand(100000000..999999999)

contact = Contact.create name: 'Carl', surname: 'Zip', address: nil
contact.emails.create email_address: 'carl@example.com'
contact.telephones.create phone_number: rand(100000000..999999999)
contact.telephones.create phone_number: rand(100000000..999999999)

contact = Contact.create name: 'Gina', surname: 'Orange', address: 'Down the road'

contact = Contact.create name: 'Goodie', surname: 'Toshoos', address: 'Down the road'

contact = Contact.create name: 'Hamlet', surname: nil, address: 'Down the road'

contact = Contact.create name: 'Brad', surname: 'Pitt', address: 'Down the road'




