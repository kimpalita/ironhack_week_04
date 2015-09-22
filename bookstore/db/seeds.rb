# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


book_one = Book.create title: 'How To Code', price: 10, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed bibendum sit amet tellus et scelerisque. Aenean vel risus eu justo venenatis consectetur et non urna.'
book_two = Book.create title: 'My Adventures', price: 12, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed bibendum sit amet tellus et scelerisque. Aenean vel risus eu justo venenatis consectetur et'
book_three = Book.create title: 'Scary Stories', price: 15, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed bibendum sit amet tellus et scelerisque. Aenean vel risus eu justo venenatis consectetur et'
book_four = Book.create title: 'Romeo and Juliet', price: 13, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed bibendum sit amet tellus et scelerisque. Aenean vel risus eu justo venenatis consectetur et'

person_one = Person.create name: 'Jane', email: 'jane@email.com'
person_one = Person.create name: 'Jim', email: 'jim@email.com'
person_one = Person.create name: 'Jack', email: 'jack@email.com'
person_one = Person.create name: 'Jill', email: 'jill@email.com'