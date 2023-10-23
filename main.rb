require 'net/http'

params = { 
  token: ENV['API_TOKEN'],
  room_id: ENV['ROOM_ID'],
  message: ENV['MESSAGE'].delete_prefix('"').delete_suffix('"')
  message_type: ENV['MESSAGE_TYPE']
}

puts message_type

if params[:message].empty?
  raise StandardError.new("empty message is not allowed.")
end

uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/messages")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

body = "body=#{params[:message]}"
headers = { "X-ChatWorkToken" => "#{params[:token]}" }

response = http.post(uri.path, body, headers)

if response.code == '200' && response.body.match(/^{"message_id":"[0-9]+"}/)
  puts response.body
else
  raise StandardError.new("action failed! #{response.body}")
end
