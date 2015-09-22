class Contact < ActiveRecord::Base
	has_many :emails
	has_many :telephones

	validates :name, presence: true, length: {maximum: 20}
end
