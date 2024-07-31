private
combOfGreatestCovNoSingleOne
	"Return all combinations with maximum coverage exclude comb of size 1"
	^ self combinationsOfGreatestCoverage reject: [:c| c combi includes: (self singleTestFullCoverage)].