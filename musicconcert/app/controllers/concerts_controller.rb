class ConcertsController < ApplicationController
	def index
		@concerts = Concert.all
		#@concert_today = Concert.find_by(date: Date.today)
		@concerts_today = Concert.where(date: Date.today)
		@concerts_future = Concert.where('date > ?', Date.today)
		@concerts_past = Concert.where('date < ?', Date.today)
		@concerts_later_this_month = Concert.later_this_month
	end

	def show
		@concert = Concert.find params[:id]
		@comments = @concert.comments
	end

	def search
	end

	def filter_concerts_price
		@results = Concert.where('price < ? AND date > ?', params[:price_budget], Date.today)
		@result_text = "Concerts with prices lower than: €#{params[:price_budget]}"
		render 'search_result'
	end

	def popular
		@concerts_future = Concert.where('date > ?', Date.today)
		@concerts_popular = Concert.order_by_comments_size(5)
	end

	def new
		@concert = Concert.new
		@concert.date = Date.today
	end

	def create
		@concert = Concert.new concert_params
		if @concert.save
			flash[:notice] = "Concert created successfully!"
			redirect_to concerts_path
		else
			flash.now[:alert] = "Could not add new concert"
			render 'new'
		end
	end

	def add_comment
		@concert = Concert.find params[:id]
		@concert.comments.create comment_text: params[:comment_text]['text']
		redirect_to concert_path
	end

	private

	def concert_params
		params.require(:concert).permit(:band, :city_id, :venue, :date, :price, :description)
	end

end
