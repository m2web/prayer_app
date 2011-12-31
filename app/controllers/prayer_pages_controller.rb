class PrayerPagesController < ApplicationController

	def home

		#The APP_CONFIG['yearsVersesArray'] is set in the /config/app_config.yml
		verseArray =  APP_CONFIG['yearsVersesArray'][0..Time.now.month-1]
		@monthlyMemoryVerses = verseArray.reverse
	
	end

  	def today
  	end

end
