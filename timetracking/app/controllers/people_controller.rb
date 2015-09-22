class PeopleController < ApplicationController
	def index
		@people = Person.all
	end

	def show
		@person = Person.find params[:id]
		@projects = Project.all
		@other_projects = []
		@projects.each do |project|
			unless @person.projects.include? project
				@other_projects << project
			end
		end
	end

	def new
		@person = Person.new
	end

	def create
		@person = Person.new person_params
		if @person.save
			redirect_to people_path
		else
			render 'new'
		end
	end

	def edit
		@person = Person.find params[:id]
	end

	def update
		@person = Person.find params[:id]
		if @person.update_attributes person_params
			redirect_to people_path
		else
			render 'edit'
		end
	end

	def destroy
		@person = Person.find params[:id]
		@person.destroy
		redirect_to people_path
	end

	def add_project
		@person = Person.find params[:id]
		@project = Project.find params[:project_id]
		@person.projects << @project
		redirect_to person_path(@person)
	end

	def remove_project
		@person = @person = Person.find params[:id]
		@projects = @person.projects
		@project = @person.projects.find params[:project_id]
		@projects.delete(@project)
		redirect_to person_path(@person)
	end

	private

	def person_params
		params.require(:person).permit(:name, :email)
	end
end
