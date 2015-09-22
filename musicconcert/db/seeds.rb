# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


w = City.create city_name: 'Paris'
x = City.create city_name: 'London'
y = City.create city_name: 'Berlin'
z = City.create city_name: 'Madrid'


a = w.concerts.create band: 'U2', venue: 'Apollo', date: Date.today, price: 65, description: 'The best concert ever!'
a.comments.create comment_text: 'This sounds awesome!'
a.comments.create comment_text: 'Saw them last year, nothing special.'

b = x.concerts.create band: 'Rolling Stones', venue: 'Venus', date: rand(30).days.from_now, price: 55, description: 'Coming to a place near you!'
b.comments.create comment_text: 'Just bought my ticket.'
b.comments.create comment_text: 'Who is comimg with?'
b.comments.create comment_text: 'I cannot go. Selling my tickets.'

c = y.concerts.create band: 'Madonna', venue: 'Neptune', date: rand(30).days.from_now, price: 50, description: 'It never gets old!'
c.comments.create comment_text: 'Meh...'

d = w.concerts.create band: 'Michael Jackson', venue: 'Jupiter', date: rand(60).days.from_now, price: 70, description: 'Brace yourselves, he is still alive!'
e = x.concerts.create band: 'Katy Perry', venue: 'Uranus', date: rand(60).days.from_now, price: 63, description: 'Come for the bonanza!'
f = z.concerts.create band: 'Justin Bieber', venue: 'Mars', date: rand(10).days.ago, price: 5, description: 'Come and feel the Bieber fever. And get sick.'

