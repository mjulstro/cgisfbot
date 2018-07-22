require_relative '../lib/tumblr_connection.rb'

meaninglessbot = Meaninglessbot.new

while (true)
	meaninglessbot.post
	meaninglessbot.answer_asks
	puts "Posted to meaninglessbot!"
	sleep 600
end