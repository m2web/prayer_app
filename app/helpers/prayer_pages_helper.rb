module PrayerPagesHelper
require 'customClasses/esv_daily_verse'
require 'customClasses/esv_passage'

	def todaysVerse
		bible = EsvDailyVerse.new
		bible.getVerse()
	end

	def getESVPassage(passage)
		bible = EsvPassage.new
		bible.doPassageQuery(passage)
	end

end
