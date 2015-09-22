class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  	render 'index'
  end

  def index_by_letter
  	first_letter = params[:first_letter]
  	@first_letter_upcase = params[:first_letter].upcase
  	@contacts = Contact.where("name LIKE ? OR name LIKE ?", "#{first_letter}%", "#{@first_letter_upcase}%")
  	#Question.where("content LIKE ? AND name is like ?", "%#{search1}%", "%#{search2}%")
  end

  def show
  	@contact = Contact.find params[:id]
  	render 'show'
  end

end
