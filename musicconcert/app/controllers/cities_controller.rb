class CitiesController < ApplicationController
	def index
	end

	def new
		@city = City.new
	end

	def create
		@city = Concert.new city_params
		if @city.save
			flash[:notice] = "City added successfully!"
			redirect_to cities_path
		else
			flash.now[:alert] = "Could not add new city"
			render 'new'
		end
	end
end
