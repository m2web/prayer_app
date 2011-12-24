class Person < ActiveRecord::Base
	has_many :requests
	validates :first_name, :length => { :minimum => 1 }
	validates :last_name, :length => { :minimum => 1 }
end
