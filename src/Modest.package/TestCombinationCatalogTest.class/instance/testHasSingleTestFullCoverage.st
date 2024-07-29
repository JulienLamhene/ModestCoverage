running
testHasSingleTestFullCoverage
	| combis |
	combis := self initializeEnv.
	"By how initializeEnv is created, there is one tests among the comb of combis, who have all the coverage possible"
	self assert: (combis hasSingleTestFullCoverage) equals: true.