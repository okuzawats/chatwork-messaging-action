require 'net/http'

params = { 
  token: ENV['API_TOKEN'],
  room_id: ENV['ROOM_ID'],
  message: ENV['MESSAGE'].delete_prefix('"').delete_suffix('"'),
  message_type: ENV['MESSAGE_TYPE'],
  user_ids_to_assign_task: ENV['USER_IDS_TO_ASSIGN_TASK']
}

# message type must be message or task.
type = params[:message_type]
valid_types = ["message", "task"]
unless valid_types.include?(type)
  raise StandardError.new("type should be message or task.")
end

if params[:message].empty?
  raise StandardError.new("empty message is not allowed.")
end

if type == "message"
  uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/messages")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  body = "body=#{params[:message]}"
  headers = { "X-ChatWorkToken" => "#{params[:token]}" }

  response = http.post(uri.path, body, headers)

  if response.code == '200'
    puts response.body
  else
    raise StandardError.new("action failed! #{response.body}")
  end
end

if type == "task"
  uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/tasks")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  body = "body=#{params[:message]}&to_ids=#{params[:user_ids_to_assign_task]}"
  headers = { "X-ChatWorkToken" => "#{params[:token]}" }

  response = http.post(uri.path, body, headers)

  if response.code == '200'
    puts response.body
  else
    raise StandardError.new("action failed! #{response.body}")
  end
end
