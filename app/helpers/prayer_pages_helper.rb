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

	def getMemoryVersesHTML
		bible = EsvPassage.new
		output = ""
		#The APP_CONFIG['yearsVersesArray'] is set in the /config/app_config.yml
		verseArray =  APP_CONFIG['yearsVersesArray'][0..Time.now.month-1]
		verseArray.reverse_each {|x| 
			output += bible.doPassageQuery(x)			
		}
		output
	end

end
