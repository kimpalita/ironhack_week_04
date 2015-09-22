class Entry < ActiveRecord::Base
	belongs_to :project
	#belongs_to :project, foreign_key: 'project_id' => this line is equivalent to the former
	validates :hours, numericality: { only_integer: true }, presence: true
	validates :minutes, numericality: { only_integer: true, less_than: 60 }, presence: true
	validates :date, presence: true
	validates :project, presence: true
end