initialization
coveredClasses
	"This method will filter our entity in so that we only have in our XPathNodeSet the data of class who have minimum of coverage for this report"

	entity := (entity select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].
	file := (file select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].