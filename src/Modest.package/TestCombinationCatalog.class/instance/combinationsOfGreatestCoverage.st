accessing
combinationsOfGreatestCoverage
	"Return all combinations with maximum coverage"
	| maxCov |
	maxCov := ((combinations sorted: [:a :b | a coverage > b coverage]) at: 1) coverage.
	^ (combinations select: [ :c | c coverage = maxCov]).