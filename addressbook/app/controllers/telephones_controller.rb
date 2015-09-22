class TelephonesController < ApplicationController
	def new
		@contact = Contact.find params[:id]
		@telephone = @contact.telephones.new
		binding.pry
	end

	def create
		@telephone = @contact.telephones.new 
	end

	private

	def telephone_params
	end
end
