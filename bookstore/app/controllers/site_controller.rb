class SiteController < ApplicationController
	def home
	end

	def login
	end

	def verify_account
		binding.pry
		if @person = Person.where(["name = ? and email = ?", params[:name], params[:email]]).first
			redirect_to person_account_path(@person.name)
		else
			render 'login'
		end
	end
end
