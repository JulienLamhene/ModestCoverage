accessing
evenlySpreadCombiOptimized
	| maxComb testMaxSize file method|
	file := (self at: 1) file. "It doesn't matter wich one the file and method studied are same for all combination, we just need the date -> to fix later"
	method := (self at: 1) method.
	maxComb:= self combinationsOfGreatestCoverage reject: [:c| c combi includes: (self singleTestFullCoverage)].
	testMaxSize := (maxComb last combi sorted: [ :t :t1 | 
	(t accessMethod: method atClass: file) lines size > (t1 accessMethod: method atClass: file) lines size]) at: 1.
	^ (maxComb allButLast reject: [:c | c combi includes: testMaxSize]) at: 1.