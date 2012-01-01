class Request < ActiveRecord::Base
	belongs_to :category
	belongs_to :person
	validates :content, :length => { :minimum => 1 }

	def person_name
		person.name if person
	end

end
