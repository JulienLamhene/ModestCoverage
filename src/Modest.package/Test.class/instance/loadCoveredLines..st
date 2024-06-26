initialization
loadCoveredLines: aXPathNodeSet
	"From a NodeSet of line, it store the data in"
	| covLines |
	aXPathNodeSet do: [ :node |
		covLines :=((node nodes 
			select: [ :line | line name = 'line']) 
				select: [ :covLine |	((covLine attributeAt: 'ci') asInteger > 0)]).
		coveredLines 
			at: (node attributeAt: 'name' ) 
			put: (Line lineFrom: covLines).
	].