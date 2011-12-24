class Category < ActiveRecord::Base
	has_many :requests
	validates :name, :length => { :minimum => 1 }
end
