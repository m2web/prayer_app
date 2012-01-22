# == Schema Information
#
# Table name: people
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
	has_many :requests
	validates :first_name, :length => { :minimum => 1 }
	validates :last_name, :length => { :minimum => 1 }

	def name
		"#{first_name} #{last_name}"
	end
end
