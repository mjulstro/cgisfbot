require_relative 'verbs.rb'
require_relative 'adjectives.rb'
require_relative 'adverbs.rb'
require_relative 'nouns.rb'

class SentenceMaker

	def initialize
		@prefixes = ["a", "the", "my", "your", "his", "her", "their", "our"]
		@adj = fill_adjectives
		@nouns = fill_nouns
		@v = fill_verbs
		@adverbs = fill_adverbs
	end

	def make_sentence
		@plural = false
		subj = make_compound_subject(@adj, @nouns, @prefixes)
		pred = make_compound_predicate(@adverbs, @v)
		return punctuate("#{subj} #{pred}")
	end

	def punctuate(sentence)
		sentence = sentence.chomp(" ").capitalize
		decider = rand(5)
		if decider == 1 then
			sentence = sentence + "?"
		elsif decider == 2 then
			sentence = sentence + "!"
		else
			sentence = sentence + "."
		end
		return sentence
	end

	def make_subject(adjectives, nouns, prefixes)
		decider = rand(2)
		if decider == 1 then
			subject = choose_adjectives(adjectives) + " #{nouns.sample}"
		else
			subject = "#{nouns.sample}"
		end
		subject = "#{prefixes.sample} " + subject
		return subject
	end

	def make_predicate(adverbs, verbs)
		if @plural == false then
			v = make_present_tense(verbs.sample)
		else
			v = verbs.sample
		end

		decider = rand(2)
		if decider == 1 then
			predicate = "#{v}" + choose_adverbs(adverbs)
		else
			predicate = "#{v}"
		end
		return predicate
	end

	def make_present_tense(verb)
		if verb.end_with?("s") or verb.end_with?("h") then
			verb = "#{verb}es"
		elsif verb.end_with?("y") then
			verb = verb.chomp("y") + "ies"
		else 
			verb = "#{verb}s"
		end
	end

	def make_compound_subject(adjectives, nouns, prefixes)
		decider = rand(4)
		if decider == 1 then
			subject = make_compound_subject(adjectives, nouns, prefixes) + " and " + make_compound_subject(adjectives, nouns, prefixes)
			@plural = true
		else
			subject = make_subject(adjectives, nouns, prefixes)
		end
		return subject
	end

	def make_compound_predicate(adverbs, verbs)
		decider = rand(4)
		if decider == 1 then
			predicate = make_compound_predicate(adverbs, verbs) + " and " + make_compound_predicate(adverbs, verbs)
		else
			predicate = make_predicate(adverbs, verbs)
		end

		return predicate
	end

	def choose_adjectives(adjectives)
		decider = rand(4)
		if decider == 1 then
			adj = choose_adjectives(adjectives) + ", " + choose_adjectives(adjectives)
		else
			adj = "#{adjectives.sample}"
		end
		return adj
	end

	def choose_adverbs(adverbs)
		decider = rand(4)
		if decider == 1 then
			adv = choose_adverbs(adverbs) + "," + choose_adverbs(adverbs)
		else
			adv = " #{adverbs.sample}"
		end
		return adv
	end

end