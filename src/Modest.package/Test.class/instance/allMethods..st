initialization
allMethods: xPathNodeSet

	| coveredMeths |
	coveredMeths := xPathNodeSet select: [ :coveredMeth |
		((coveredMeth nodeAt: 1) attributeAt: 'covered') asInteger > 0 ].
	1 to: coveredMeths size do: [ :i |
		coveredMethods add: 
			(Method methodFrom: (coveredMeths at: i))
	].
	coveredMethods do: [ :meth | self loadLinesfor: meth ]