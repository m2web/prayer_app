require 'net/http'

class EsvDailyVerse
  def initialize
	@options = [
		"include-short-copyright=0",
		#"output-format=plain-text",
		"include-passage-horizontal-lines=0",
		"include-heading-horizontal-lines=0",
		"include-footnotes=false",
		#"include-passage-references=false",
		"include-short-copyright=false",
		"include-content-type=false"].join("&")
    @base_url = "http://www.esvapi.org/v2/rest/dailyVerse?key=687d2878725c2801&"
  end

  def getVerse
    get_url @base_url+@options
  end
  
  private
  def get_url(url)
    Net::HTTP.get(::URI.parse(url))
  end

end

