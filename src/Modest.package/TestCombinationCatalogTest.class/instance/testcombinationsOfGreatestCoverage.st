running
testcombinationsOfGreatestCoverage
	"Return all combinations with maximum coverage"
	| combis col comb|
	combis := TestCombinationCatalog new.
	combis 
		add: (TestCombination new coverage: 5);
		add: (TestCombination new coverage: 1);
		add: (TestCombination new coverage: 5);
		add: (TestCombination new coverage: 3).
	comb := (TestCombination new coverage: 5).
	col := OrderedCollection new.
	col add: comb; add: comb.
	self assert: combis combinationsOfGreatestCoverage asString equals: col asString.