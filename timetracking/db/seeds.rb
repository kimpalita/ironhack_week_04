# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def generate_entries(project, total)
	total.times do
		project.entries.create hours: rand(4), minutes: rand(59), date: rand(3).months.ago, comments: "entry comment for #{project.name}"
	end
end

a = Project.create name: 'first project', description: 'something about it...'
generate_entries(a, 5)

b = Project.create name: 'second project', description: 'second description...'
generate_entries(b, 4)

c = Project.create name: 'third project', description: 'third description...'
generate_entries(c, 6)

person = Person.create name: 'Alice', email: 'alice@email.com'
person.projects << a
person.projects << b

other_person = Person.create name: 'Bob', email: 'bob@email.com'
other_person.projects << b
other_person.projects << c
