class PrayerPagesController < ApplicationController

	def home

		@title = "Mark's Prayer App"

		#The APP_CONFIG['yearsVersesArray'] is set in the /config/app_config.yml
		verseArray =  APP_CONFIG['yearsVersesArray'][0..Time.now.month-1]
		@monthlyMemoryVerses = verseArray.reverse

		#today's Westminster Catechism Q and A
		@westminster_catechism_qand_a = WestminsterCatechismQandA.find_by_questionnumber(todaysWestministerCatechismQandAnumber)

		#Joshua's Men Verses here
		@jmverses = getJMVerse

		#date that is displayed
		@todaysDate = Time.now.strftime("%A - %B %e, %Y")
		
		#today's Valley of Vision Prayer
		@vovPrayerNumber = todaysValleyOfVisionPrayer

	end

	def today

		@title = "Today's Prayer"

		#get today's requests to pray and trust God
		@todaysRequests = getTodaysRequests

		# get all prayer categories for the drop down
		#@allPrayerRequests = getAllRequests
		@allPrayerCategories = getAllCategories
		
		#get today's Psalm to read for a reminder to adore the one true God
		@thePsalmChapter = getTodaysPsalm

	end

	#start of the private helper methods
	private
	
	def getTodaysRequests
	#get the total number of requests
		requests = Request.all
		requests = requests.sort_by { |request| request.category_name }
		requestsCount = requests.length

		#keep adding 1 as 0 does not act as a good divisor or multiplicand
		#get the day number
		dayNumber = Time.new.wday + 1
		
		#categories per day = (categories / number of days of prayer w unique requests)
		categoriesPerDay = ( requests.length / 4)

#if have this block commented out as I wanted to make each day a random prayer selection. at least for awhile
		#determine the last category to pray about that day
#		if (dayNumber * categoriesPerDay <= requestsCount ) then
#			categoryEnd = dayNumber * categoriesPerDay
#		else
			#get a random number for category end since the last days of the week will have the same requests
#			if (dayNumber > 5) then #if day greater than Thursday (+1 as 0 not good divisor or multiplicand)
				categoryEnd = Random.new.rand(4..requestsCount)
#			else #it is Monday - Thursday
#				categoryEnd = requestsCount;
#			end
#		end
	
		#determine the first category to pray about that day
		categoryStart = categoryEnd - categoriesPerDay;

		requests[categoryStart..categoryEnd-1] #minus 1 as it is 0 based

	end

	def getTodaysPsalm

		#get today's Psalm to read to open prayer in adoration
		monthDayNumber = Time.now.mday
		#if the 31st then set a random day
    if (monthDayNumber > 30) then
    	#given that there are 150 Psalms, max day is 30
      monthDayNumber = Random.new.rand(1..30)
    end

		daysLastChapterNumber = monthDayNumber * 5
    daysFirstChapterNumber = daysLastChapterNumber - 4

		Random.new.rand(daysFirstChapterNumber..daysLastChapterNumber)
	
	end

	def todaysWestministerCatechismQandAnumber

		#get today's question
		numberOfQuestions = 107
		numberOfQuestionsX2 = numberOfQuestions * 2
		numberOfQuestionsX3 = numberOfQuestions * 3

		todaysNumber = getTodaysNumber
		
		if todaysNumber > numberOfQuestions && todaysNumber <= numberOfQuestionsX2 then
			todaysNumber = todaysNumber - numberOfQuestions
		elsif todaysNumber > numberOfQuestionsX2 && todaysNumber <= numberOfQuestionsX3 then
			todaysNumber = todaysNumber - numberOfQuestionsX2
		elsif todaysNumber > numberOfQuestionsX3 then
			todaysNumber = Random.new.rand(1..numberOfQuestions)
		end
		
		todaysNumber
	end

	def getAllCategories
			categories = Category.all
			categories = categories.sort_by { |category| category.name }
	end

	def getJMVerse
		# the verse months are February to November or 2 to 11
		monthNumber = Time.now.month
		#we are starting at February but I want to be a month ahead so add 1 to the month number
		monthNumber = monthNumber + 1
		
		#if it is November or December, then stay in November as there is no Dec verse
		if Time.now.month >= 11
			monthNumber = 11
		end

		verseMonthNumbers = (0..monthNumber).to_a #to.a is a toArray command to get the range into an array i.e. [1,2,3]
		@jmverses = JmVerse.find(:all, :order => 'verse_month DESC', :conditions=> {:verse_month => [verseMonthNumbers]})

	end
	
	def todaysValleyOfVisionPrayer
		#I have scraped the Valley of Vision Prayers available from Banner of Truth (http://www.banneroftruth.org/pages/dailydevotion.php)
		#and have them as web pages, each numbered, so they are 1.html thru 159.html. So lets get the proper URL for today.
		#Let's get the prayer for the day of the year. We will go thru all the prayers 2X then after day 318 we will be random in the selection.
		
		todaysPrayerNumber = getTodaysNumber
		numberOfPrayers = 159
		numberOfPrayersX2 = numberOfPrayers * 2
		
		if todaysPrayerNumber > numberOfPrayers && todaysPrayerNumber <= numberOfPrayersX2 then
			todaysPrayerNumber = todaysPrayerNumber - numberOfPrayers
		elsif todaysPrayerNumber > numberOfPrayersX2 then
			todaysPrayerNumber = Random.new.rand(1..numberOfPrayers)
		end
		
		todaysPrayerNumber
	end
	
	def getTodaysNumber
		Time.now.yday
	end

end
