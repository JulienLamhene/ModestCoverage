accessing - testing
hasSingleTestFullCoverage: lines
	^ ((self combiOf: 1) detect: [ :c | c unionCovered = lines]) combi isNotEmpty.