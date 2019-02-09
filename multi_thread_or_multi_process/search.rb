require 'open-uri'
require 'json'

class SearchImagesAndPopularity
  BASE_URL = "https://www.googleapis.com/customsearch/v1?&"
  PARAMS = {
    # replace ENV[] to your own id/key, or
    # write it in .env file when you use it in Rails app
    # DON'T push this to Github with your own key hard-coded!!!
    cx: ENV["SEARCH_ENGINE_ID"],
    key: ENV["GOOGLE_CUSTOM_SEARCH_KEY"],
    num: 9,
    searchType: "image",
    imgColorType: "color",
    safe: "active",
    fields: "searchInformation(searchTime,totalResults),items/link"
  }
  @url = BASE_URL + PARAMS.map { |k, v| "#{k}=#{v}" }.join("&")

  def self.call(keyword)
    doc = JSON.parse(open(URI.encode(@url + "&q=#{keyword}")).read)
    {
      popularity: doc["searchInformation"]["totalResults"].to_i,
      image_paths: doc["items"].map { |item| item["link"] }
    }
  end
end
