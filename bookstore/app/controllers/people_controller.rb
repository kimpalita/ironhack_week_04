class PeopleController < ApplicationController
	def index	
		@person = Person.find_by(name: params[:name])
		@books = Book.all
	end
end
