class Request < ActiveRecord::Base
	belongs_to :category
	belongs_to :person
	validates :content, :length => { :minimum => 1 }

	def person_name
		person.name if person
	end

	def category_name
		category.name if category
	end

end
