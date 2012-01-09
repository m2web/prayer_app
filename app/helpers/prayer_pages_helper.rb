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
			output << bible.doPassageQuery(x)			
		}
		output
	end

	def monthReadingSchedule
		thisMonthsReading = "http://markmcfadden.net/prayerweb/DailyReading/" + Time.now.month.to_s + ".html"
	end

	#************************************************************
	# This is no longer used but keeping for refernece
	#************************************************************
	#require 'open-uri'
	#require 'nokogiri'
	#def todaysWestminsterCatechism
	#	question = ""
	#	wscXMLDoc = Nokogiri::XML(open("http://www.markmcfadden.net/assets/westminster_shorter_catechism.xml"))
		
	#	#get today's question
	#	numberOfQuestions = 107
	#	numberOfQuestionsX2 = numberOfQuestions * 2
	#	numberOfQuestionsX3 = numberOfQuestions * 3

	#	todaysNumber = Time.now.yday
		
	#	if todaysNumber > numberOfQuestions && todaysNumber < numberOfQuestionsX2 then
	#		todaysNumber = todaysNumber - numberOfQuestions
	#	elsif todaysNumber > numberOfQuestionsX2 && todaysNumber < numberOfQuestionsX3 then
	#		todaysNumber = todaysNumber - numberOfQuestionsX2
	#	elsif todaysNumber > numberOfQuestionsX3 then
	#		todaysNumber = Random.new.rand(1..numberOfQuestions)
	#	end
	
	#	#now that you have the question # get the actual question and answer
	#	wscXMLDoc.root.traverse do |elem|
  #		question << elem.parent.content if elem.name == "position" && elem.text == todaysNumber.to_s
	#	end
	#	question
	#end

end
