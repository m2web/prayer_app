module PrayerPagesHelper
require 'net/http'
	def todaysVerse
		options = [
			#"output-format=plain-text",
			"include-passage-horizontal-lines=0",
			"include-heading-horizontal-lines=0",
			"include-footnotes=false",
			#"include-passage-references=false",
			#"include-short-copyright=false",
			"include-content-type=false"].join("&")
		base_url = "http://www.esvapi.org/v2/rest/dailyVerse?key=IP&"    
		Net::HTTP.get(::URI.parse(base_url+options))
	end
end
