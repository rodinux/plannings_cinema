response = HTTParty.get('https://ecranvillage.net/wp-json/ecranvillage-api/v2/export/?nocache')
puts response.body, response.code, response.message, response.headers.inspect
json.array!(response)