require 'net/http'

params = { 
  token: ARGV[0],
  room_id: ARGV[1],
  title: ARGV[2][1, ARGV[2].length - 2],
  message: ARGV[3][1, ARGV[3].length - 2]
}

uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/messages")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

body = "body=[info][title]#{params[:title]}[/title]#{params[:message]}[/info]"
headers = { "X-ChatWorkToken" => "#{params[:token]}" }

response = http.post(uri.path, body, headers)

puts response.code
puts response.body
