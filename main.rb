require 'net/http'

params = { 
  token: ENV['API_TOKEN'],
  room_id: ENV['ROOM_ID'],
  message: ENV['MESSAGE'].delete_prefix('"').delete_suffix('"'),
  task_user_id: ENV['TASK_USER_ID'],
}

if params[:message].empty?
  raise StandardError.new("empty message is not allowed.")
end

base_uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/")
body = "body=#{params[:message]}"
if params[:task_user_id]
  uri = base_uri + "tasks"
  body += "&to_ids=#{params[:task_user_id]}"
else
  uri = base_uri + "messages"
end

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

headers = { "X-ChatWorkToken" => "#{params[:token]}" }

response = http.post(uri.path, body, headers)

if response.code == '200'
  puts response.body
else
  raise StandardError.new("action failed! #{response.body}")
end
