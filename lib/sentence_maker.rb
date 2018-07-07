def make_sentence
	articles = ["a", "the", "my", "your"]
	adjectives = ["big", "small"]
	nouns = ["cat", "dog"]
	verbs = ["eats", "plays", "runs"]
	adverbs = ["loudly", "happily"]

	subj = make_compound_subject(adjectives, nouns, articles, 2)
	pred = make_compound_predicate(adverbs, verbs, 2)
	return "#{subj}#{pred}"
end

def make_subject(adjectives, nouns, articles)
	decider = rand(2)
	if decider == 1 then
		subject = choose_adjectives(adjectives, 2) + "#{nouns.sample} "
	else
		subject = "#{nouns.sample} "
	end
	
	decider = rand(2)
	if decider == 1 then
		subject = "#{articles.sample} " + subject
	end

	return subject
end

def make_predicate(adverbs, verbs)
	decider = rand(2)
	if decider == 1 then
		predicate = "#{verbs.sample} " + choose_adverbs(adverbs, 2)
	else
		predicate = "#{verbs.sample} "
	end
	return predicate
end

def make_compound_subject(adjectives, nouns, articles, num)
	decider = rand(num)
	if decider == 1 then
		subject = make_compound_subject(adjectives, nouns, articles, num)
		+ " and " + make_compound_subject(adjectives, nouns, articles, num)
	else
		subject = make_subject(adjectives, nouns, articles)
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