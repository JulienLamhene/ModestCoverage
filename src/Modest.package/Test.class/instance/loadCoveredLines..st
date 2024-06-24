initialization
loadCoveredLines: aXPathNodeSet
	| lines |
	lines := aXPathNodeSet select: [
	:covLine |	
		((covLine attributeAt: 'ci') asInteger > 0)
	].
	1 to: (lines size) do: [ :i | 
		coveredLines add: (Line lineFrom: lines at: i)
	].