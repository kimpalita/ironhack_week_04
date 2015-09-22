class Concert < ActiveRecord::Base
	validates :date, presence: true
	validate :date_not_past
	validates :band, presence: true
	validates :venue, presence: true
	validates :city, presence: true
	validates :price, presence: true, numericality: { only_integer: true }
	validates :description, presence: true

	has_many :comments
	belongs_to :city

	def date_not_past
	    errors.add(:date, "can't be in the past") if
	      date < Date.today
	end

	def self.later_this_month
		from = Date.today + 1
		to = from.end_of_month + 1.day
		filtered = where("date > ? AND date < ?", from, to)
		filtered
	end

	def self.order_by_comments_size(number)
		concerts_future = where('date > ?', Date.today)
		ordered_ascending = concerts_future.sort_by {|concert| concert.comments.size }
		ordered_descending = ordered_ascending.reverse
		ordered_descending.first(number)
	end


end
