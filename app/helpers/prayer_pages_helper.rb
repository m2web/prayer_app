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

	def getMemoryVerses
		bible = EsvPassage.new
		output = ""
		yearsVersesArray = [ "Matthew 6:33", "John 1:1", "Genesis 1:1", "Galatians 2:20", "2 Timothy 3:16", "Psalms 1:1-2", "Proverbs 21:1", "Romans 1:19-20", "Ephesians 1:3-6", "Revelation 7:9-10", "James 4:7-8", "John 1:14" ]
		verseArray = yearsVersesArray[0..Time.now.month-1]
		verseArray.reverse_each {|x| 
			output += bible.doPassageQuery(x)			
		}
		output
	end

end
