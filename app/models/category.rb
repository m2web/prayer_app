class Category < ActiveRecord::Base
	has_many :requests
	validates :name, :length => { :minimum => 1 }

	#accepts_nested_attributes_for :requests
end
