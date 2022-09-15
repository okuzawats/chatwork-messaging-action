require 'net/http'

params = { 
  token: ENV['API_TOKEN'],
  room_id: ENV['ROOM_ID'],
  title: ENV['TITLE'],
  message: ENV['MESSAGE']
}

uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/messages")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

body = "body=[info][title]#{params[:title]}[/title]#{params[:message]}[/info]"
headers = { "X-ChatWorkToken" => "#{params[:token]}" }

response = http.post(uri.path, body, headers)

if response.code == '200' && response.body.match(/^{"message_id":"[0-9]+"}/)
  puts response.body
else
  raise StandardError.new("action failed! #{response.body}")
end
