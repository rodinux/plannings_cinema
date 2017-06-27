response = HTTParty.get('https://www.ecranvillage.net/wp-json/ecranvillage-api/v2/export')
puts response.body, response.code, response.message, response.headers.inspect
json.array!(response)