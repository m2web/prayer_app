# == Schema Information
#
# Table name: westminster_catechism_qand_as
#
#  id             :integer         not null, primary key
#  questionnumber :integer
#  question       :text
#  answer         :text
#  created_at     :datetime
#  updated_at     :datetime
#

class WestminsterCatechismQandA < ActiveRecord::Base
end
