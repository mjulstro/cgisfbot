require_relative '../lib/sentence_maker.rb'

speaker = SentenceMaker.new

for i in 1..10
	puts speaker.make_sentence
end