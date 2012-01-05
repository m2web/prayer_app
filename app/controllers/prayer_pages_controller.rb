class PrayerPagesController < ApplicationController

	def home

		#The APP_CONFIG['yearsVersesArray'] is set in the /config/app_config.yml
		verseArray =  APP_CONFIG['yearsVersesArray'][0..Time.now.month-1]
		@monthlyMemoryVerses = verseArray.reverse
	
	end

	def today
		#get today's requests to pray and trust God
		@todaysRequests = getTodaysRequests
		
		#get today's Psalm to read for a reminder to adore the one true God
		@thePsalmChapter = getTodaysPsalm

	end
	
	#start of the private helper methods
	private
	
	def getTodaysRequests
	#get the total number of requests
		requests = Request.all
		@requestsCount = requests.length

		#keep adding 1 as 0 does not act as a good divisor or multiplicand
		#get the day number
		@dayNumber = Time.new.wday + 1
		
		#categories per day = (categories / number of days of prayer w unique requests) + 1
		@categoriesPerDay = ( requests.length / 5) + 1

		#determine the last category to pray about that day
		if (@dayNumber * @categoriesPerDay <= @requestsCount ) then
			@categoryEnd = @dayNumber * @categoriesPerDay
		else
			#get a random number for category end since the last days of the week will have the same requests
        if (@dayNumber > 5) then #if day greater than Thursday (+1 as 0 not good divisor or multiplicand)
	        #Random random = new Random();
          #@categoryEnd = random.Next(3, numberOfCategories);
					@categoryEnd = Random.new.rand(3..@requestsCount)
        else #it is Monday - Thursday
					@categoryEnd = @requestsCount;
				end
		end
	
		#determine the first category to pray about that day
		@categoryStart = @categoryEnd - @categoriesPerDay;

		requests[@categoryStart..@categoryEnd-1] #minus 1 as it is 0 based

	end

	def getTodaysPsalm

		#get today's Psalm to read to open prayer in adoration
		@monthDayNumber = Time.now.mday
		#if the 31st then set a random day
    if (@monthDayNumber > 30) then
    	#given that there are 150 Psalms, max day is 30
      @monthDayNumber = Random.new.rand(1..30)
    end

		@daysLastChapterNumber = @monthDayNumber * 5
    @daysFirstChapterNumber = @daysLastChapterNumber - 4

		Random.new.rand(@daysFirstChapterNumber..@daysLastChapterNumber)
	
	end

end
