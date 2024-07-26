initialization
allMethods: xPathNodeSet
	"Load the methods used by our test"
	| coveredMeths |
	xPathNodeSet do: [ :node |
		coveredMeths :=((node nodes 
			select: [ :line | line name = 'method']) 
				select: [ :cov | (((cov nodeAt: 1) attributeAt: 'covered') asInteger > 0)]).
		coveredMethods 
			at: (node attributeAt: 'sourcefilename' ) 
			put: (Method loadMethodsFrom: coveredMeths).
	].
 	coveredMethods associationsDo: [ :asso |
		|key value|
		key := asso key.
		value := asso value.
		value do: [ :innerVal | self loadLinesOf: key for: innerVal ].
	].