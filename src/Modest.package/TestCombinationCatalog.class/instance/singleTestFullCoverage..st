accessing - testing
singleTestFullCoverage: lines
	(self hasSingleTestFullCoverage: lines) ifTrue: [ 
		^ ((self combiOf: 1) detect: [ :c | 
			c unionCovered = (lines)]) combi at: 1] .