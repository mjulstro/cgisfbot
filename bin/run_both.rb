require_relative '../lib/tumblr_connection.rb'

while (true)
	post_to_impulsivebot
	puts "Posted to impulsivebot!"
	slep 600
	
	post_to_meaninglessbot
	puts "Posted to meaninglessbot!"
	sleep 600
end