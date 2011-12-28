require 'net/http'

class EsvPassage
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
    @base_url = "http://www.esvapi.org/v2/rest/passageQuery?key=IP"
  end

  def doPassageQuery(passage)
    passage = passage.gsub(/\s/, "+")
    passage = passage.gsub(/\:/, "%3A")
    passage = passage.gsub(/\,/, "%2C")
    get_url @base_url +
             "&passage=#{passage}&#{@options}"
  end
  
  private

  def get_url(url)
    Net::HTTP.get(::URI.parse(url))
  end
end

