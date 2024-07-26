accessing
evenlySpreadCombination
	"Return the combination who is not the single test, but who get the maximum coverage"
	| maxComb |
	maxComb:= self combinationsOfGreatestCoverage reject: [:c| c combi includes: (self singleTestFullCoverage)].
	maxComb := maxComb sorted: [:a :b | a combi size < b combi size].
	^ maxComb at: 1.