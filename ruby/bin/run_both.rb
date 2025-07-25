require_relative '../lib/tumblr_connection.rb'

meaninglessbot = Meaninglessbot.new
impulsivebot = Impulsivebot.new

while (true)
	impulsivebot.post
	puts "Posted to impulsivebot!"
	sleep 600
	
	meaninglessbot.post
	puts "Posted to meaninglessbot!"
	meaninglessbot.answer_asks
	puts "Answered meaninglessbot's asks!"
	sleep 600
end