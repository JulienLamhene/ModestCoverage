accessing - testing
singleTestFullCoverage
	"Return the test who's have all lines of a method covered if it exists"
	(self hasSingleTestFullCoverage) ifTrue: [ 
		^ ((self combiOf: 1) detect: [ :c | 
			c unionCovered = (lines)]) combi at: 1] .