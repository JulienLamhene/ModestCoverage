accessing - testing
hasSingleTestFullCoverage
	"Check if a combinations of size 1 has all lines covered"
	^ ((self combiOf: 1) detect: [ :c | c unionCovered = lines]) combi isNotEmpty.