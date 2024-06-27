initialization
allMethods: xPathNodeSet
	| coveredMeths |
	xPathNodeSet do: [ :node |
		coveredMeths :=((node nodes 
			select: [ :line | line name = 'method']) 
				select: [ :cov |	(((cov nodeAt: 1) attributeAt: 'covered') asInteger > 0)]).
		coveredMethods 
			at: (node attributeAt: 'sourcefilename' ) 
			put: (Method loadMethodsFrom: coveredMeths).
	].
"	coveredMethods do: [ :meth | self loadLinesfor: meth ]."