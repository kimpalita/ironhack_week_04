class EntriesController < ApplicationController
  def index
  	@project = Project.find params[:project_id]
  	@entries = @project.entries.order(date: :desc)
  end

  def new
  	@project = Project.find params[:project_id]
  	@entry = @project.entries.new
  	@entry.hours = 0
  	@entry.minutes = 0
  	@entry.date = Date.today
  end

  def create
  	@project = Project.find params[:project_id]
  	@entry = @project.entries.new entry_params
  	if @entry.save
      flash[:notice] = "Entry created successfully!"
      #flash.notice = ... => is the same
  		redirect_to project_entries_path(@project)
  	else
      flash.now[:alert] = "Could not create entry"
  		render 'new'
  	end
  end

  def edit
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
  end

  def update
    @project = Project.find params[:project_id]
    @entry = Entry.find params[:id]

    if @entry.update_attributes entry_params
      redirect_to project_entries_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @entry = Entry.find params[:id]

    @entry.destroy
    redirect_to project_entries_path(@project)
  end

  private

  def entry_params
  	params.require(:entry).permit(:date, :hours, :minutes, :comments)
  end

end
