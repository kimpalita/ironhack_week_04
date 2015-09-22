class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created_projects(10)
		if @projects.empty?
			render 'index', layout: 'no_projects'
		end
	end

	def show
		#@project = Project.find_by(id: params[:id])
		unless @project = Project.find_by(id: params[:id])
			render 'project_not_found'
		end
		@people = @project.people
	end

	def new
		#Rails.logger.info "______ I'm in "
		@project = Project.new
	end

	def create
		@project = Project.new project_params
		if @project.save
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find params[:id]
	end

	def update
		@project = Project.find params[:id]
		if @project.update_attributes project_params
			redirect_to project_path(@project)
		else
			render 'edit'
		end
	end

	def destroy
		@project = Project.find params[:id]
		@project.destroy
		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:name, :description)
	end
end