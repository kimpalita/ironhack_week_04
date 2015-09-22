class Project < ActiveRecord::Base
	has_many :entries
	has_many :participations
	has_many :people, through: :participations

	validates :name, presence: true, length: {maximum: 30}, uniqueness: true,
					 format: {with: /\A[^\s][\sa-zA-Z0-9]+[^\s]\z/}

	def self.iron_find( number )
		where( id: number ).first
	end

	def self.clean_old
		today = Date.current
		week_before = today - 7.days
		old_projects = where("created_at < ?", week_before)
		old_projects.destroy_all
		#for one-line => where("created_at < ?", 1.week.ago).destroy_all
	end

	def self.last_created_projects(number)
		order(created_at: :desc).limit(number)
	end

	def total_hours_in_month(month, year)
		from = Date.new(year, month, 1)
		to = from.end_of_month + 1.day
		filtered = entries.where("date > ? AND date < ?", from, to)
		total_minutes = filtered.inject(0){|sum,entry| sum + entry.minutes if entry.minutes.present? }
		total_hours = filtered.inject(0){|sum,entry| sum + entry.hours if entry.minutes.present? } + (total_minutes/60)
		total_hours
	end

	def total_hours_this_month
		total_hours_in_month(Date.current.month, Date.current.year)
	end
end
