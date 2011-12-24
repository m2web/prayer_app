class Request < ActiveRecord::Base
	belongs_to :category
	belongs_to :person
	validates :content, :length => { :minimum => 1 }
end
