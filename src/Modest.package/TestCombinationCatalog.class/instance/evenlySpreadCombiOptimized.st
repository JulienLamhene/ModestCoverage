accessing - coverage
evenlySpreadCombiOptimized
	| maxComb combi |
	"This method return the combinations with the most smallest test"
	maxComb:= self combOfGreatestCovNoSingleOne.
	combi := self evenlySpreadCombination combi.
	^ (maxComb reject: [ :c | c combi includesAll: combi ]) at: 1.