require_relative 'verbs.rb'
require_relative 'adjectives.rb'
require_relative 'adverbs.rb'
require_relative 'nouns.rb'

def make_sentence
	prefixes = ["a", "the", "my", "your", "his", "her", "their", "our"]
	adj = fill_adjectives
	nouns = fill_nouns
	v = fill_verbs
	adverbs = fill_adverbs

	subj = make_compound_subject(adj, nouns, prefixes, 2)
	pred = make_compound_predicate(adverbs, v, 2)
	return punctuate("#{subj}#{pred}")
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
		subject = choose_adjectives(adjectives, 2) + "#{nouns.sample} "
	else
		subject = "#{nouns.sample} "
	end
	subject = "#{prefixes.sample} " + subject
	return subject
end

def make_predicate(adverbs, verbs)
	v = make_present_tense(verbs.sample)
	decider = rand(2)
	if decider == 1 then
		predicate = "#{v} " + choose_adverbs(adverbs, 2)
	else
		predicate = "#{v} "
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

def make_compound_subject(adjectives, nouns, prefixes, num)
	decider = rand(num)
	if decider == 1 then
		subject = make_compound_subject(adjectives, nouns, prefixes, num)
		+ " and " + make_compound_subject(adjectives, nouns, prefixes, num)
	else
		subject = make_subject(adjectives, nouns, prefixes)
	end
	return subject
end

def make_compound_predicate(adverbs, verbs, num)
	decider = rand(num)
	if decider == 1 then
		predicate = make_compound_predicate(adverbs, verbs, num + 1)
		+ " and " + make_compound_predicate(adverbs, verbs, num + 1)
	else
		predicate = make_predicate(adverbs, verbs)
	end
	return predicate
end

def choose_adjectives(adjectives, num)
	decider = rand(num)
	if decider == 1 then
		adj = choose_adjectives(adjectives, num + 1)
		+ ", " + choose_adjectives(adjectives, num + 1)
	else
		adj = "#{adjectives.sample} "
	end
	return adj
end

def choose_adverbs(adverbs, num)
	decider = rand(num)
	if decider == 1 then
		adv = choose_adverbs(adverbs, num + 1)
		+ ", " + choose_adverbs(adverbs, num + 1)
	else
		adv = "#{adverbs.sample} "
	end
	return adv
end

def run
	for i in 0..10
		puts make_sentence
	end
end

run