require 'rest-client'
require 'json'

def test

  raw_json = RestClient.get("https://www.giantbomb.com/api/games/?api_key=e557578a11e07ac8ba68c4823e186bb115e1452a")

  puts JSON.parse(raw_json)[0]

end

test
